//
//  HomeService.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/4/17.
//Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift

class HomeService: HomeServiceType {
    func getWeather(latitude: Double, longitude: Double, success: @escaping(Weather) -> (), failure: @escaping(String) -> ()) {
        Alamofire.request(ApiConstants.getWeatherUrl(latitude: latitude, longitude: longitude), method: .get)
            .responseObject{(response: DataResponse<Weather>) in
                switch response.result {
                case .success:
                    success(response.result.value!)
                    break
                case .failure:
                    failure(response.error.debugDescription)
                    break
                }
        }
    }
    
    func getForcast(latitude: Double, longitude: Double, success: @escaping ([ListModel]) -> (), failure: @escaping (String) -> ()) {
        Alamofire.request(ApiConstants.getForecastUrl(latitude: latitude, longitude: longitude), method: .get)
            .responseObject{(response: DataResponse<WeatherForcast>) in
                switch response.result {
                case .success:
                    let listModel: List<ListModel> = (response.result.value?.list)!
                    success(Array(listModel))
                    break
                case .failure:
                    failure(response.error.debugDescription)
                    break
                }
        }
    }
}
