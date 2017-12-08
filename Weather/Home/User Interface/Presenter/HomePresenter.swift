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
}

 // MARK: Home module interface
extension HomePresenter: HomeModuleInterface {
    func getWeather(latitude: Double, longitude: Double) {
        self.view?.showLoading()
        interactor?.getWeather(latitude: latitude, longitude: longitude)
    }
}

// MARK: Home interactor output interface
extension HomePresenter: HomeInteractorOutput {
    func onSuccess(weather: Weather) {
        view?.hideLoading()
        let realm = try! Realm()
        let weatherFromDb: Weather = realm.objects(Weather.self).first!
        print("Xais: \(String(describing: weatherFromDb.id))")
        view?.populateData(data: weather)
    }
    
    func onFailure(error: String) {
        view?.hideLoading()
        print(error)
    }
}
