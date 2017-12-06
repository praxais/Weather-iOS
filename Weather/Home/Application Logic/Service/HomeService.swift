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
    func getWeather(latitude: Double, longitude: Double, success: @escaping(Weather) -> (), failure: @escaping(String) -> ()) {
        Alamofire.request("\(ApiConstants.baseUrl)/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&APPID=\(ApiConstants.apiKey)",
            method: .get)
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
}
