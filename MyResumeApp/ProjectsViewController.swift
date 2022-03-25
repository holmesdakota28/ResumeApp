//
//  ProjectsViewController.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/24/22.
//

import Foundation
import UIKit

class ProjectsViewController: UIViewController {
    
    let titleArr = ["Educational Project – Datapath – 2021",
                    "Educational Project – Datapath – 2020",
                    "Face Detection Project – Matlab- 2021"]
    let infoArr = ["- Mobile web application built on Xcode using Swift, educational tool for microarchitectural elements of CPU, including datapath elements, instructions stages and control signals (source code for app created entirely by me, Matthew Faulk helped provide information",
                   "- Mobile web application built on Xcode using React-native, educational tool for microarchitectural elements of CPU, including datapath elements, instructions stages and control signals (source code for app created entirely by me, Matthew Faulk helped provide information",
                   "- Matlab script files that will implement a face detector using a set number of faces/nonfaces that is trained by combining multiple weak classifiers into a single strong classifier known as Adaboost. The result from the face detector will then be used on a training set to see how accurave the strong classifier is (bootstrapping). The same method will be used again this time with a skin detector algorithm to improve efficiency"]
    let extraArr = ["- Swift, objective C, Xcode",
                    "- React-Native, JavaScript, Visual Studios, Android Simulator",
                    "- Matlab, Script files "]
    
    
    let tableview: UITableView = {
            let tv = UITableView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
    

    
    override func viewDidLoad() {
        title = "Projects"
        layout()
        setupTableView()
    }
}

extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func layout() {
        tableview.backgroundColor = generateRandomPastelColor(withMixedColor: .systemMint)
        tableview.separatorColor = generateRandomPastelColor(withMixedColor: .systemGreen)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ProjectsTableCell

        cell.backgroundColor = generateRandomPastelColor(withMixedColor: .systemMint)
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.infoLabel.text = infoArr[indexPath.row]
        cell.extraLabel.text = extraArr[indexPath.row]
        return cell
    }
    
    func setupTableView() {
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(ProjectsTableCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

extension ProjectsViewController {
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
