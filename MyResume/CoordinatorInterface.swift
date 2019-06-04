//
//  CoordinatorInterface.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: Coordinator Interface
/// The main interface for all coordinator types.
protocol CoordinatorInterface: AnyObject {
    /// The navigation controller that controls the flow for the coordinator.
    var navigationController: UINavigationController { get set }
    
    /// The method that starts the flow for the coordinator.
    func start()
}
