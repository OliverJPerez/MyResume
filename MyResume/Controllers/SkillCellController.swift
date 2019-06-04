//
//  SkillCellController.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: SkillCellController
class SkillCellController: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    // MARK: - Properties
    var stars = [UIImageView]()
    public var skill = String() {
        didSet{
            skillName.text = skill
        }
    }
    public var score = Int() {
        didSet {
            for index in 0..<score {
                stars[index].image = UIImage(named: "star")
            }
        }
    }
    
    // MARK: - Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        stars.append(star1)
        stars.append(star2)
        stars.append(star3)
        stars.append(star4)
        stars.append(star5)
    }
}
