//
//  EducationTableCell.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/25/22.
//

import Foundation
import UIKit

class EducationTableCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "BACHELOR OF COMPUTER SCEINCE, TEXAS STATE UNIVERSITY"
        
        
        return label
    }()
    
    let graduationYearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "DECEMEBER 2021 YEAR"
        return label
    }()
    
    let gpaLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Computer Science GPA: 3.30"
        label.textAlignment = .center
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "\u{2022} Upon arrival to Texas State, all my general core curriculum had been completed through ACC (Austin Community College).  I attended classes continuously (including both summer sessions each year) for nineteen-months.  Upon which I successfully completed twenty-one total classes consisting of computer science and complex math courses; exemplifying commitment and dedication to obtain my personal goal.  "
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EducationTableCell {
    func setupView() {
        cellView.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemPink)
        addSubview(cellView)
        cellView.addSubview(mainLabel)
        cellView.addSubview(graduationYearLabel)
        cellView.addSubview(gpaLabel)
        cellView.addSubview(infoLabel)
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor.constraint(equalToConstant: 80),
            mainLabel.widthAnchor.constraint(equalToConstant: 360),
            mainLabel.topAnchor.constraint(equalToSystemSpacingBelow: cellView.topAnchor, multiplier: 1),
            mainLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            graduationYearLabel.heightAnchor.constraint(equalToConstant: 40),
            graduationYearLabel.widthAnchor.constraint(equalToConstant: 360),
            graduationYearLabel.topAnchor.constraint(equalToSystemSpacingBelow: mainLabel.bottomAnchor, multiplier: 1),
            graduationYearLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            gpaLabel.heightAnchor.constraint(equalToConstant: 40),
            gpaLabel.widthAnchor.constraint(equalToConstant: 360),
            gpaLabel.topAnchor.constraint(equalToSystemSpacingBelow: graduationYearLabel.bottomAnchor, multiplier: 1),
            gpaLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            //infoLabel.heightAnchor.constraint(equalToConstant: 400),
            infoLabel.widthAnchor.constraint(equalToConstant: 360),
            infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: gpaLabel.bottomAnchor, multiplier: 1),
            infoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            
            
        ])
        

        
    }
}

extension EducationTableCell {
    // Adapted from Stack Overflow answer by David Crow http://stackoverflow.com/a/43235
    // Question: Algorithm to randomly generate an aesthetically-pleasing color palette by Brian Gianforcaro
    // Method randomly generates a pastel color, and optionally mixes it with another color
    func generateRandomPastelColor(withMixedColor mixColor: UIColor?) -> UIColor {
        // Randomly generate number in closure
        let randomColorGenerator = { ()-> CGFloat in
            CGFloat(arc4random() % 256 ) / 256
        }
            
        var red: CGFloat = randomColorGenerator()
        var green: CGFloat = randomColorGenerator()
        var blue: CGFloat = randomColorGenerator()
            
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
