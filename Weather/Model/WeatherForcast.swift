//
//  WeatherForcast.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/14/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import ObjectMapper
import ObjectMapper_Realm
import RealmSwift

class WeatherForcast: Object, Mappable {
    @objc dynamic var cod: String? = ""
    @objc dynamic var message: Double = 0.0
    @objc dynamic var cnt: Int = 0
    var list: List<ListModel>?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "cnt"
    }
    
    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        list <- (map["list"], ListTransform<ListModel>())
    }
}

class ListModel: Object, Mappable {
    @objc dynamic var dt: Int = 0
    @objc dynamic var main: MainModel?
    var weather: List<WeatherModel>?
    @objc dynamic var clouds: CloudsModel?
    @objc dynamic var date: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- (map["weather"], ListTransform<WeatherModel>())
        clouds <- map["clouds"]
        date <- map["dt_txt"]
    }
}

class MainModel: Object, Mappable {
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var temp_min: Double = 0.0
    @objc dynamic var temp_max: Double = 0.0
    @objc dynamic var pressure: Double = 0.0
    @objc dynamic var sea_level: Double = 0.0
    @objc dynamic var grnd_level: Double = 0.0
    @objc dynamic var humidity: Double = 0.0
    @objc dynamic var temp_kf: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        sea_level <- map["sea_level"]
        grnd_level <- map["grnd_level"]
        humidity <- map["humidity"]
        temp_kf <- map["temp_kf"]
    }
}

class WeatherModel : Object, Mappable {
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String = ""
    @objc dynamic var descriptionS: String = ""
    @objc dynamic var icon: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        descriptionS <- map["description"]
        icon <- map["icon"]
    }
}

class CloudsModel: Object, Mappable {
    @objc dynamic  var all: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}
