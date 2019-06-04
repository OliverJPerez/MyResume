//
//  ExperienceController.swift
//  MyResume
//
//  Created by OliverPérez on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: ExperienceController
class ExperienceController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var workPlacesTable: UITableView!

    // MARK: - Properties
    var workPlaces: [WorkPlace] = []
    public var showDetail: ((WorkPlace, UIColor) -> Void)?

    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Methods
    private func setUpTable() {
        workPlacesTable.delegate = self
        workPlacesTable.dataSource = self
        workPlacesTable.separatorStyle = .none
    }
}
