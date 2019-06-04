//
//  Storyboarded.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: Storyboarded
/// Protocol that lets an easily creation of View Controllers from a storyboard.
protocol Storyboarded {
    /// Instantiates a type that conforms to this protocol from a storyboard.
    /// - Parameter storyboardName: The name of the storyboard from which to instantiate a conforming type.
    static func instantiate(from storyboardName: String) -> Self
}

// MARK: Storyboarded-ViewController
extension Storyboarded where Self: UIViewController {
    /// Instantiates a `UIViewController` or a subclass from a storyboard.
    /// - Parameter storyboardName: The name of the storyboard from which to instantiate the view controller.
    static func instantiate(from storyboardName: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

