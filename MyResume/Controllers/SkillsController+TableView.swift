//
//  SkillsChartController+Extensions.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: SkillsController
extension SkillsController: UITableViewDataSource {
    
    // MARK: - TableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell") as! SkillCellController
        let rgba = Constants.Colors.bgCell.rgba
        let newRed = rgba.red + CGFloat(indexPath.row + 1)/35.0
        let newGreen = rgba.green + CGFloat(indexPath.row + 1)/35.0
        let newBlue = rgba.blue + CGFloat(indexPath.row + 1)/35.0
        let cellBackground = UIView()
        
        cellBackground.backgroundColor = Constants.Colors.selectedCell
        cell.skillName.text = skills[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.score = skills[indexPath.row].score
        cell.selectedBackgroundView = cellBackground
        cell.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
        cell.tintColor = UIColor.white
        
        if indexPath.row == skills.count - 1{
            tableView.setBackgroundColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
            view.backgroundColor = tableView.backgroundColor
        }
        return cell
    }
}
