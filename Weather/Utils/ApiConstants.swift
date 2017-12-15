//
//  ApiConstants.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/5/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

class ApiConstants {
    static let baseUrl = "http://api.openweathermap.org"
    static let apiKey = "434d1145e31b7937aaa94e2faff65d0d"
    
    static let statusOk = 200
    
    static func getWeatherUrl(latitude: Double, longitude: Double) -> String {
        let url = "/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&APPID="
        return ApiConstants.baseUrl + url + ApiConstants.apiKey
    }
    
    static func getForecastUrl(latitude: Double, longitude: Double) -> String {
        let url = "/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&APPID="
        return ApiConstants.baseUrl + url + ApiConstants.apiKey
    }
}
