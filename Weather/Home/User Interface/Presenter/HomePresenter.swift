//
//  HomePresenter.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import RealmSwift

class HomePresenter {
	// MARK: Properties
    weak var view: HomeViewInterface?
    var interactor: HomeInteractorInput?
    var wireframe: HomeWireframe?

    // MARK: Converting entities
    private var latitude = 0.0
    private var longitude = 0.0
}

 // MARK: Home module interface
extension HomePresenter: HomeModuleInterface {
    func getWeather(latitude: Double, longitude: Double) {
        self.view?.showLoading()
        self.latitude = latitude
        self.longitude = longitude
        interactor?.getWeather(latitude: latitude, longitude: longitude)
    }
}

// MARK: Home interactor output interface
extension HomePresenter: HomeInteractorOutput {
    func onWeatherSuccess(weather: Weather) {
        let realm = try! Realm()
        let weatherFromDb: Weather = realm.objects(Weather.self).first!
        print("Xais: \(String(describing: weatherFromDb.id))")
        view?.populateData(data: weather)
    }
    
    func onForcastSuccess(forcast: [ListModel]) {
        interactor?.getForcast(latitude: latitude, longitude: longitude)
        view?.hideLoading()
    }
    
    func onFailure(error: String) {
        view?.hideLoading()
        print(error)
    }
}
