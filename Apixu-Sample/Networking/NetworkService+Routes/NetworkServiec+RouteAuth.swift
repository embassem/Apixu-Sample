//
//  NetworkServiec+RouteAuth.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

extension NetworkService {

    func getForecast(city: String, days: Int = 7, delegate: @escaping NetworkServiceResponse<ApixuBase> ) {
        self.request(
            endPoint: APIs.forecast(city: city, days: days),
            modelType: ApixuBase.self,
            responseType: .root) { (networkResult, statusCode, json, response, responseType) in
                delegate(networkResult, statusCode, json, response, responseType)
        }
    }

}
