//
//  HomeViewInterface.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

protocol HomeViewInterface: class {
    func showLoading()
    
    func hideLoading()
    
    func populateData(data: Weather)
    
    func populateForcastData(forcastList: [ListModel])
    
    func showToast(string: String)
}
