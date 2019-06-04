//
//  ViewController.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

//MARK: ProfileController
class ProfileController: UIViewController, Storyboarded {

    // MARK: - IBOulets
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var sectionsTable: UITableView!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var profileName: UILabel!
    
    // MARK: - Properties
    public var getProfile: Constants.Alias.profileResponse?
    public var showDetail: ((Section, UIColor) -> Void)?
    var profile: Profile?
    var summaryText = String() {
        didSet{
            summary.text = summaryText
        }
    }
    var name = String() {
        didSet{
            profileName.text = name
        }
    }
    var sections = [Section]() {
        didSet{
            sectionsTable.reloadData()
        }
    }
    var imageURL = String() {
        didSet{
           profilePicture.load(from: imageURL)
        }
    }
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MyProfile"
        setUpTable()
        getProfile?{[weak self] profile in
            self?.profile = profile
            self?.sections = profile.sections
            self?.summaryText = profile.summary
            self?.imageURL = profile.profilePicURL
            self?.name = profile.name
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profilePicture.layer.cornerRadius = profilePicture.frame.width / 2
    }
    
    // MARK: - Methods
    private func setUpTable() {
        sectionsTable.delegate = self
        sectionsTable.dataSource = self
        sectionsTable.separatorStyle = .none
    }
}
