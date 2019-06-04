//
//  Constants.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: Constants
/// Global constants
public enum Constants {
    // Storyboard names to instantiate controllers from the coordinator
    public struct StoryboardNames {
        public static let main = "Main"
    }
    
    /// Alias names to make easier closure declarations
    public struct Alias {
        public typealias profileResponse = (@escaping(Profile) -> Void) -> Void
    }
    
    /// Custom colors
    public struct Colors {
        public static let selectedCell = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        public static let bgCell = #colorLiteral(red: 0.004170713946, green: 0.3283109069, blue: 0.5748987794, alpha: 1)
    }
}
