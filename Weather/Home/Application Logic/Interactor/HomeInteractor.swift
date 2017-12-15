//
//  HomeInteractor.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import Foundation
import RealmSwift

class HomeInteractor {
	// MARK: Properties
    weak var output: HomeInteractorOutput?
    private let service: HomeServiceType
    
    // MARK: Initialization
    init(service: HomeServiceType) {
        self.service = service
    }
}

// MARK: Home interactor input interface
extension HomeInteractor: HomeInteractorInput {
    func getWeather(latitude: Double, longitude: Double) {
        service.getWeather(latitude: latitude, longitude: longitude, success: {
            (weather) in
            self.saveWeatherToDb(weather: weather)
            self.output?.onWeatherSuccess(weather: weather)
        }, failure: {
            (failure) in
            self.output?.onFailure(error: failure)
        })
    }
    
    func getForcast(latitude: Double, longitude: Double) {
        service.getForcast(latitude: latitude, longitude: longitude, success: {
            (success) in
            self.output?.onForcastSuccess(forcast: success)
        }, failure: {
            (failure) in
            self.output?.onFailure(error: failure)
        })
    }
    
    private func saveWeatherToDb(weather: Weather){
        let realm = try! Realm()
        try! realm.write {
            realm.add(weather, update: true)
        }
    }
}
