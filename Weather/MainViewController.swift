//
//  MainViewController.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        let homeViewController = HomeWireframe().getMainView()
        homeViewController.tabBarItem.title = "Home"
        
        let homeViewController2 = HomeViewController()
        homeViewController2.view.backgroundColor = UIColor.blue
        homeViewController2.tabBarItem.title = "Search"
        
        let homeViewController3 = HomeViewController()
        homeViewController3.view.backgroundColor = UIColor.blue
        homeViewController3.tabBarItem.title = "More"
        
        self.viewControllers = [homeViewController, homeViewController2, homeViewController3]
    }
}
