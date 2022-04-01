//
//  EducationViewController.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/25/22.
//

import Foundation
import UIKit

class EducationViewController: UIViewController {

    
    let tableview: UITableView = {
            let tv = UITableView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
    
    override func viewDidLoad() {
        title = "Education"
        layout()
        setupTableView()
    }
}

extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! EducationTableCell
        cell.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemMint)
        return cell
    }
    
    func layout() {
        tableview.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemMint)
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(EducationTableCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    
}

extension EducationViewController {
    // Adapted from Stack Overflow answer by David Crow http://stackoverflow.com/a/43235
    // Question: Algorithm to randomly generate an aesthetically-pleasing color palette by Brian Gianforcaro
    // Method randomly generates a pastel color, and optionally mixes it with another color
    func generateRandomPastelColor(withMixedColor mixColor: UIColor?) -> UIColor {
        // Randomly generate number in closure

        var red: CGFloat = 128
        var green: CGFloat = 0
        var blue: CGFloat = 0
            
        // Mix the color
        if let mixColor = mixColor {
            var mixRed: CGFloat = 0, mixGreen: CGFloat = 0, mixBlue: CGFloat = 0;
            mixColor.getRed(&mixRed, green: &mixGreen, blue: &mixBlue, alpha: nil)
            
            red = (red + mixRed) / 2;
            green = (green + mixGreen) / 2;
            blue = (blue + mixBlue) / 2;
        }
            
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
