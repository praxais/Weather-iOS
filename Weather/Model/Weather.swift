//
//  Weather.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/5/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import ObjectMapper

class Weather: Mappable {
    var coord: Coord?
    var weather: [WeatherInner]?
    var base: String?
    var main: Main?
    var visibility: String?
    var wind: Wind?
    var clouds: Clouds?
    var dt: CLong?
    var sys: Sys?
    var id: Int?
    var name: String?
    var cod: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }
}

class Coord: Mappable {
    var lon: Double?
    var lat: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
}

class WeatherInner: Mappable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}

class Main: Mappable {
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
    }
}

class Wind: Mappable {
    var speed: Double?
    var deg: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

class Clouds: Mappable {
    var all: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}

class Sys: Mappable {
    var type: Int?
    var id: Int?
    var message: Double?
    var country: String?
    var sunrise: CLong?
    var sunset: CLong?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        id <- map["id"]
        message <- map["message"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
