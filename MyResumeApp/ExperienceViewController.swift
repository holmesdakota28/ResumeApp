//
//  ExperienceViewController.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/24/22.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController {
    
    let dateArr = ["MAY 2020 – AUGUST 2020 & MAY 2021 – AUGUST 2021",
                   "MARCH 2016 – JANURAURY 2020 ",
                   "FEBURARY 2013 – MARCH 2016" ]
    
    let titleArr = ["TUBE DIRECTOR/RUNNER, TEXAS STATE TUBES ",
                   "SERVER, COVER 3",
                   "HOST-->SERVER, TGI FRIDAYS " ]
    
    let infoArr = ["Manage large parties of people at river entrance and ensuring that there is no glass or Styrofoam with any individual. Gather each tube at the end of the float and return them to the entrance via vehicle.   ",
                   "Responsibilities of being a server in a high paced environment require communicating to guest effectively, gather multiple food/drink orders from each table accurately/efficiently and collecting then disbursing bills. Conflict resolution and negotiation with customers, memorizing each detail for every menu item, rotating specialty drinks and seasonal menu items.   ",
                   "Responsibilities of being a server in a high paced environment require communicating to guest effectively, gather multiple food/drink orders from each table accurately/efficiently and collecting then disbursing bills. Conflict resolution and negotiation with customers, memorizing each detail for every menu item, rotating specialty drinks and seasonal menu items.   " ]
    
    let tableview: UITableView = {
            let tv = UITableView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
    
    override func viewDidLoad() {
        title = "Experience"
        layout()
        setupTableView()
    }
}

extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ExperienceTableCell
        cell.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemMint)
        cell.dateLabel.text = dateArr[indexPath.row]
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.infoLabel.text =  "\u{2022}" + infoArr[indexPath.row]
        return cell
    }
    
    func layout() {
        tableview.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemMint)
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(ExperienceTableCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

extension ExperienceViewController {
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

