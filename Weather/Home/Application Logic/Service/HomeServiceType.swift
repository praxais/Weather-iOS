//
//  HomeServiceType.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

protocol HomeServiceType: class {
    func getWeather(latitude: Double, longitude: Double, success: @escaping(Weather) -> (), failure: @escaping(String) -> ())
    
    func getForcast(latitude: Double, longitude: Double, success: @escaping([ListModel]) -> (), failure: @escaping(String) -> ())
}
