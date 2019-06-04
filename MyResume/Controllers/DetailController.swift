//
//  SectionDetailController.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: DetailController
class DetailController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textContainer: UITextView!
    
    // MARK: - Properties
    public var sectionTitle = String()
    public var summary  = String()
    public var bgColor = UIColor.white
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor
        titleLbl.text = sectionTitle
        textContainer.text = summary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
