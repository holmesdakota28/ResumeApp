//
//  AppDelegate.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/23/22.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let tabBarVC = TabBarViewController()
    let loginVC = LoginViewController()
    

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.darkGray
        
        loginVC.delegate = self
        tabBarVC.delegater = self
        
        //window?.rootViewController = tabBarVC
        window?.rootViewController = loginVC
        
        return true
    }

}

extension AppDelegate: TabBarControllerDelegate {
    func didClickProfile() {
        //print("delegate was called")
        //window?.rootViewController = loginVC
        setRootViewController(loginVC)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didClickResume() {
        //print("delegate was called")
        //window?.rootViewController = tabBarVC
        setRootViewController(tabBarVC)
    }
}


extension AppDelegate {
    //call this method anytime we swap methods.
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        //we need to unwrap the window, so we'll use guard
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        //1 is way too much time, so change it to something more reasonable. It takes a float value
        UIView.transition(with: window,
                          duration: 1,
                          options: .transitionCurlUp,
                          animations: nil,
                          completion: nil)
    }
}


