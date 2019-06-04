//
//  SkillsChartController.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: SkillsController
class SkillsController: UIViewController, Storyboarded {

    // MARK: - IBOutlets
    @IBOutlet weak var skillsTable: UITableView!
    
    // MARK: - Properties
    var skills: [Skill] = []

    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // Mark: Methods
    private func setUpTable() {
        skillsTable.dataSource = self
        skillsTable.separatorStyle = .none
        skillsTable.rowHeight = 44
    }
}
