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

class HomeService: HomeServiceType {
    private func getUrl(latitude: Double, longitude: Double) -> String {
        let url = "/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&APPID="
        return ApiConstants.baseUrl + url + ApiConstants.apiKey
    }
    
    func getWeather(latitude: Double, longitude: Double, success: @escaping(Weather) -> (), failure: @escaping(String) -> ()) {
        Alamofire.request(getUrl(latitude: latitude, longitude: longitude), method: .get)
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
        Alamofire.request(getUrl(latitude: latitude, longitude: longitude), method: .get)
            .responseObject{(response: DataResponse<WeatherForcast>) in
                switch response.result {
                case .success:
                    success(response.result.value!.list!)
                    break
                case .failure:
                    failure(response.error.debugDescription)
                    break
                }
        }
    }
}
