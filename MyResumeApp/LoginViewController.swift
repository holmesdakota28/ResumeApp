//
//  ViewController.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/23/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didClickResume()
}

class LoginViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    weak var delegate: LoginViewControllerDelegate?
    
    let mainStackView = UIStackView()

    let profileImage : UIImageView = UIImageView()
    let codyImage = UIImage(named:"Cody")
    let profileStackView = UIStackView()

    let nameLabel = UILabel()
    let nameStackView = UIStackView()
    
    let addressLabel = UILabel()
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let informationStackView = UIStackView()
    
    let linkedInButton = UIButton()
    let gitHubButton = UIButton()
    let githubImage = UIImage(named: "GithubImage")
    
    let buttonStackView = UIStackView()
    
    let resumeButton = UIButton()
    let resumeStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
}

extension  LoginViewController {
    func style() {
        let colorScheme = generateRandomPastelColor(withMixedColor: .systemMint)
        
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.distribution = .fillProportionally
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = codyImage
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.text = "Dakota Holmes"
        nameLabel.font = UIFont.systemFont(ofSize: 25.0)
        nameStackView.backgroundColor = colorScheme
        nameStackView.layer.cornerRadius = 5
        nameStackView.layer.borderWidth = 2
        nameStackView.layer.borderColor = UIColor.black.cgColor

        
        informationStackView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.textAlignment = .center
        addressLabel.text = "Address: Far Far Far Away"
        phoneLabel.textAlignment = .center
        phoneLabel.text = "Phone Number: 987-654-3210"
        emailLabel.textAlignment = .center
        emailLabel.text = "Email: batman_robin@yahoo.com"
        informationStackView.backgroundColor = colorScheme
        informationStackView.layer.cornerRadius = 5
        informationStackView.axis = .vertical
        informationStackView.distribution = .fillEqually

        
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.configuration = .filled()
        resumeButton.tintColor = generateRandomPastelColor(withMixedColor: UIColor.red)
        resumeButton.configuration?.imagePadding = 8
        resumeButton.setTitle("Resume Details", for: [])
        resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .primaryActionTriggered)
        resumeButton.layer.borderWidth = 2
        resumeButton.layer.cornerRadius = 5
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        linkedInButton.translatesAutoresizingMaskIntoConstraints = false
        //linkedInButton.configuration = .filled()
        //linkedInButton.tintColor = generateRandomPastelColor(withMixedColor: UIColor.red)
        linkedInButton.configuration?.imagePadding = 8
        //linkedInButton.setTitle("Resume Details", for: [])
        linkedInButton.addTarget(self, action: #selector(linkedInButtonTapped), for: .primaryActionTriggered)
        linkedInButton.layer.borderWidth = 2
        linkedInButton.layer.cornerRadius = 5
        linkedInButton.setBackgroundImage(UIImage(named: "LinkedInImage"), for: [])
        
        
        gitHubButton.translatesAutoresizingMaskIntoConstraints = false
        //gitHubButton.configuration = .filled()
        //gitHubButton.tintColor = generateRandomPastelColor(withMixedColor: UIColor.red)
        gitHubButton.configuration?.imagePadding = 8
        //gitHubButton.setTitle("Resume Details", for: [])
        gitHubButton.addTarget(self, action: #selector(githubButtonTapped), for: .primaryActionTriggered)
        gitHubButton.layer.borderWidth = 2
        gitHubButton.layer.cornerRadius = 5
        gitHubButton.setBackgroundImage(UIImage(named: "GitHubImage"), for: [])
        
    }
    
    func layout() {
        
        nameStackView.addArrangedSubview(nameLabel)
        profileStackView.addArrangedSubview(profileImage)
        informationStackView.addArrangedSubview(addressLabel)
        informationStackView.addArrangedSubview(phoneLabel)
        informationStackView.addArrangedSubview(emailLabel)
        buttonStackView.addArrangedSubview(linkedInButton)
        buttonStackView.addArrangedSubview(gitHubButton)
        resumeStackView.addArrangedSubview(resumeButton)
        
        mainStackView.addArrangedSubview(nameStackView)
        mainStackView.addArrangedSubview(profileStackView)
        mainStackView.addArrangedSubview(informationStackView)
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(resumeStackView)
            
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            nameStackView.heightAnchor.constraint(equalToConstant: 40),
            informationStackView.heightAnchor.constraint(equalToConstant: 150),
            resumeStackView.heightAnchor.constraint(equalToConstant: 35),
            resumeStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -100),
            resumeStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 100),
            resumeStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 5)
        ])

                
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            mainStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 1),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 1),
            mainStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 1)
        ])
        

    }
}

extension LoginViewController {
    @objc func resumeButtonTapped(sender: UIButton){
        delegate?.didClickResume()
        }
    @objc func linkedInButtonTapped(sender: UIButton){
        UIApplication.shared.openURL(NSURL(string: "https://github.com/holmesdakota28")! as URL)
        }
    @objc func githubButtonTapped(sender: UIButton){
        UIApplication.shared.openURL(NSURL(string: "https://github.com/holmesdakota28")! as URL)
        }
}

extension LoginViewController {
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
