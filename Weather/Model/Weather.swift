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
    @objc dynamic var base: String?
    @objc dynamic var main: Main?
    @objc dynamic var visibility: String?
    @objc dynamic var wind: Wind?
    @objc dynamic var clouds: Clouds?
    var dt: CLong?
    @objc dynamic var sys: Sys?
    var id: Int?
    @objc dynamic var name: String?
    var cod: Int?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
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
    var lon: Double?
    var lat: Double?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
}

class WeatherInner: Object, Mappable {
    var id: Int?
    @objc dynamic var main: String?
    @objc dynamic var descriptionString: String?
    @objc dynamic var icon: String?
    
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
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?
    
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
    var speed: Double?
    var deg: Double?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

class Clouds: Object, Mappable {
    var all: Double?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}

class Sys: Object, Mappable {
    var type: Int?
    var id: Int?
    var message: Double?
    var country: String?
    var sunrise: CLong?
    var sunset: CLong?
    
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
