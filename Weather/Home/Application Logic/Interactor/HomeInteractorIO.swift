//
//  HomeInteractorIO.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

protocol HomeInteractorInput: class {
    func getWeather(latitude: Double, longitude: Double)
    
    func getForcast(latitude: Double, longitude: Double)
}

protocol HomeInteractorOutput: class {
    func onWeatherSuccess(weather: Weather)
    
    func onForcastSuccess(forcast: [ListModel])
    
    func onFailure(error: String)
}
