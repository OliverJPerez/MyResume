//
//  ExperienceController+TableVIew.swift
//  MyResume
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: ExperienceController Extensions
extension ExperienceController: UITableViewDelegate, UITableViewDataSource {
   
    // MARK: - TableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell")!
        let cellBackground = UIView()
        let rgba = Constants.Colors.bgCell.rgba
        let newRed = rgba.red + CGFloat(indexPath.row + 1)/15.0
        let newGreen = rgba.green + CGFloat(indexPath.row + 1)/15.0
        let newBlue = rgba.blue + CGFloat(indexPath.row + 1)/15.0
       
        cellBackground.backgroundColor = Constants.Colors.selectedCell
        cell.textLabel?.text = workPlaces[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.selectedBackgroundView = cellBackground
        cell.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
        cell.tintColor = UIColor.white
        
        if indexPath.row == workPlaces.count - 1{
            tableView.setBackgroundColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
            view.backgroundColor = tableView.backgroundColor
        }
        return cell
    }
    
    // MARK: - TableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bgColor = tableView.cellForRow(at: indexPath)?.backgroundColor ?? UIColor.white
        tableView.deselectRow(at: indexPath, animated: true)
        showDetail?(workPlaces[indexPath.row], bgColor)
    }
}
