//
//  Service.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import Foundation

// MARK: Service
/// Singleton class representing the networking layer
public final class Service {
    //MARK: Properties
    static let shared = Service() // Shared singleton instance
    private var session: URLSession
    
    // MARK: - Public Enums
    /// Posible error cases while fetching data from the API
    public enum NetworkingErrors: Error {//Define the errors that we can find when the app fetch the URL
        case invalidData
        case invalidRequest
        case invalidURL
        case invalidResponse
    }
    
    /// Keys to get the correspondant URLs from the User Settings
    public enum URLKeys: String {
        case profileURL = "ProfileURL"
        // MARK: - Testing URLs
        case testInvalidData = "TestInvalidData"
        case testInvalidRequest = "TestInvalidRequest"
        case testInvalidURL = "TestInvalidURL"
    }
    
    // MARK: - Initializers
    private init() {
        self.session = URLSession(configuration: .default)
    }
    
    // MARK: - Methods
    /// Gets the user profile from API and decodes it into ‘Profile‘ data model
    ///
    /// - Parameters:
    ///   - url: The URL to request the profile
    ///   - completion: Completion handler to call back the result of the request
    public func getProfile(with urlKey: URLKeys = .profileURL, completion: @escaping (Result<Profile, NetworkingErrors>) -> Void) {
        
        guard let url = getURL(for: urlKey.rawValue) else {
            completion(.failure(.invalidURL)) // The URL is nil
            return
        }
        
        // MARK: - Data Task
        let task = session.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidRequest)) // Something went wrong with the request
            }
            else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    if let profile = try? jsonDecoder.decode(Profile.self, from: data) {
                        DispatchQueue.main.async {
                            completion(.success(profile)) // Returns successfully the profile data
                        }
                    }
                    else {
                        completion(.failure(.invalidData)) // Failure while trying to decode the response data
                    }
                }
            }
            else {
                completion(.failure(.invalidResponse))
            }
        }
        task.resume()
    }
    
    /// Returns the URL for the given key
    ///
    /// - Parameters:
    ///   - key: The key to get the URL from the info.plist
    func getURL(for key: String) -> URL? {
        let rawURL = Bundle.main.object(forInfoDictionaryKey: key) as? String ?? ""
        return URL(string: rawURL)
    }
}
