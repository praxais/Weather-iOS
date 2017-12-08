//
//  Weather.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/5/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class Weather: Object, Mappable {
    @objc dynamic var coord: Coord?
    var weather: List<WeatherInner>?
    @objc dynamic var base: String = ""
    @objc dynamic var main: Main?
    @objc dynamic var visibility: String = ""
    @objc dynamic var wind: Wind?
    @objc dynamic var clouds: Clouds?
    @objc dynamic var dt: Int = 0
    @objc dynamic var sys: Sys?
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var cod: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        coord <- map["coord"]
        weather <- (map["weather"], ListTransform<WeatherInner>())
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

class Coord: Object, Mappable {
    @objc dynamic var lon: Double = 0.0
    @objc dynamic var lat: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
}

class WeatherInner: Object, Mappable {
    @objc dynamic var id: String = ""
    @objc dynamic var main: String = ""
    @objc dynamic var descriptionString: String = ""
    @objc dynamic var icon: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        descriptionString <- map["description"]
        icon <- map["icon"]
    }
}

class Main: Object, Mappable {
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var pressure: Double = 0.0
    @objc dynamic var humidity: Double = 0.0
    @objc dynamic var tempMin: Double = 0.0
    @objc dynamic var tempMax: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
    }
}

class Wind: Object, Mappable {
    @objc dynamic var speed: Double = 0.0
    @objc dynamic var deg: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

class Clouds: Object, Mappable {
    @objc dynamic var all: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}

class Sys: Object, Mappable {
    @objc dynamic var type: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var message: Double = 0.0
    @objc dynamic  var country: String = ""
    @objc dynamic var sunrise: Int = 0
    @objc dynamic  var sunset: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
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
