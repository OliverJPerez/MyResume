//
//  ProfileViewController+TableView.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import UIKit

// MARK: ProfileController Extensions
extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell")!
        let cellBackground = UIView()
        let rgba = Constants.Colors.bgCell.rgba
        let newRed = rgba.red + CGFloat(indexPath.row + 1)/15.0
        let newGreen = rgba.green + CGFloat(indexPath.row + 1)/15.0
        let newBlue = rgba.blue + CGFloat(indexPath.row + 1)/15.0
       
        cellBackground.backgroundColor = Constants.Colors.selectedCell
        cell.textLabel?.text = sections[indexPath.row].title
        cell.textLabel?.textColor = UIColor.white
        cell.selectedBackgroundView = cellBackground
        cell.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
        cell.tintColor = UIColor.white
        
        if indexPath.row == sections.count - 1{
            tableView.setBackgroundColor(red: newRed, green: newGreen, blue: newBlue, alpha: rgba.alpha)
            view.backgroundColor = tableView.backgroundColor
        }
        return cell
    }
    
    // MARK: - TableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bgColor = tableView.cellForRow(at: indexPath)?.backgroundColor ?? UIColor.white // Reset selected color
        showDetail?(sections[indexPath.row], bgColor)
    }
}

