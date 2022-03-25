//
//  ExperienceTableCell.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/24/22.
//

import Foundation
import UIKit

class ExperienceTableCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
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

extension ExperienceTableCell {
    func setupView() {
        addSubview(cellView)
        cellView.backgroundColor = generateRandomPastelColor(withMixedColor: UIColor.systemOrange)
        cellView.addSubview(dateLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(infoLabel)
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            dateLabel.widthAnchor.constraint(equalToConstant: 360),
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: cellView.topAnchor, multiplier: 1),
            dateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.widthAnchor.constraint(equalToConstant: 360),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1),
            
            //infoLabel.heightAnchor.constraint(equalToConstant: 300),
            infoLabel.widthAnchor.constraint(equalToConstant: 360),
            infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            infoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cellView.leadingAnchor, multiplier: 1)
        ])
        
        
    }
}

extension ExperienceTableCell {
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
