//
//  Extensions.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: UIImageView Extensions
extension UIImageView {
    /// Downloads an image from URL
    /// - Parameters:
    ///   - urlString: URL of the image resource
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        // Start downloading in background thread
        DispatchQueue.global().async { [unowned self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

// MARK: UIColor Extensions
extension UIColor {
    /// Returns the rgba components of a UIColor instance
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}

// MARK: UITableView Extensions
extension UITableView {
    /// Sets the table view background colors given the rgba components
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let newRed = red + 0.1
        let newGreen = green + 0.1
        let newBlue = blue + 0.1
        self.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
    }
}
