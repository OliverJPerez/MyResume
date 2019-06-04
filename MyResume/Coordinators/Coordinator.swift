//
//  MasterCoordinator.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: MasterCoordinator
/// Responsable of the all the navigation flow and bussiness logic of the app
public final class Coordinator: CoordinatorInterface {
    // MARK: - Properties
    public var navigationController: UINavigationController
    weak var profileController: ProfileController!
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    /// Sets the first view controller of the navigation flow
    func start() {
        profileController = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        profileController.showDetail = { [weak self] in
            self?.showDetail(for: $0, bgColor: $1)
        }
        profileController.getProfile = { [weak self] in
            self?.fetchProfileInfo(completion: $0)
        }
        navigationController.pushViewController(profileController, animated: true)
    }
    
    /// Shows the detail view of a section
    ///
    /// - Parameters:
    ///   - section: A section of the profile resume
    ///   - bgColor: Background color of the detail view
    func showDetail(for section: Section, bgColor: UIColor) {
        // If in the current section has skills to show
        if let skills = section.skills {
            showSkills(skills)
        }
        // If in the current section has work places to show
        else  if let workPlaces = section.workPlaces {
            showWorkPlaces(workPlaces)
        }
        else {
        // If in the current section has only a description
            let detailController = DetailController.instantiate(from: Constants.StoryboardNames.main)
            detailController.sectionTitle = section.title
            detailController.summary = section.summary ?? ""
            detailController.bgColor = bgColor
            navigationController.pushViewController(detailController, animated: true)
        }
    }
    
    /// Shows the skills detail view
    ///
    /// - Parameters:
    ///   - skills: The skills that will be shown in detail
    func showSkills(_ skills: [Skill]) {
        let skillsController = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        skillsController.skills = skills
        navigationController.pushViewController(skillsController, animated: true)
    }
    
    /// Shows the work places history table view
    ///
    /// - Parameters:
    ///   - works: The work places to be shown
    func showWorkPlaces(_ works: [WorkPlace]) {
        let experienceController = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        experienceController.workPlaces = works
        experienceController.showDetail = { [weak self] in
            self?.showWorkDetail(for: $0, bgColor: $1)
        }
        navigationController.pushViewController(experienceController, animated: true)
    }
    
    /// Shows the detail view of a working place
    ///
    /// - Parameters:
    ///   - work: The work place to be shown in detail
    ///   - bgColor: Background color of the detail view
    func showWorkDetail(for work: WorkPlace, bgColor: UIColor) {
        let detailController = DetailController.instantiate(from: Constants.StoryboardNames.main)
        detailController.sectionTitle = work.name
        detailController.summary = work.description
        detailController.bgColor = bgColor
        navigationController.pushViewController(detailController, animated: true)
    }
    
    // MARK: - Fetching methods
    /// Fetches the profile object using the ‘Service‘ layer singleton object
    ///
    /// - Parameters:
    ///   - completion: A callback after getting a response from the service, returning either the profile information or nil
    func fetchProfileInfo(completion: @escaping (Profile) -> Void) {
        Service.shared.getProfile{ fetchResult in
            switch fetchResult {
            case .success(let profile):
                completion(profile)
            case .failure:
                self.showAlert(title: "Error", message: "An error has occurred, try again later")
            }
        }
    }
    
    /// Shows an alert when an error happens while fetching the profile information
    ///
    /// - Parameters:
    ///   - title: The title of the alert
    ///   - message: The message body of the alert
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        profileController.present(alertController, animated: true)
    }
}
