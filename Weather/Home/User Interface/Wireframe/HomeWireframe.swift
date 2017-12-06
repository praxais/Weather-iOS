//
//  HomeWireframe.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit

class HomeWireframe {
     weak var view: UIViewController?
}

extension HomeWireframe: WireframeInput {
    var storyboardName: String {return "Home"}
    
    func getMainView() -> UIViewController {
        let homeService = HomeService()
        
        let interactor = HomeInteractor(service: homeService)
        
        let presenter = HomePresenter()
        let viewController = viewControllerFromStoryboard(of: HomeViewController.self)
        
        viewController.presenter = presenter
        
        interactor.output = presenter
        
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
