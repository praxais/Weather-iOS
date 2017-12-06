//
//  HomeInteractorIO.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

protocol HomeInteractorInput: class {
    func getWeather(latitude: Double, longitude: Double)
}

protocol HomeInteractorOutput: class {
    func onSuccess(weather: Weather)
    
    func onFailure(error: String)
}
