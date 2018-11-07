//
//  APIs.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import Foundation
import Moya

enum APIs {

    case forecast(city:String, days:Int)
}

extension APIs: TargetType {
    var baseURL: URL {
        return URL(string: NetworkDefault.baseURL)!
    }

    var sampleData: Data {
        return "API.".data(using: String.Encoding.utf8)!
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        switch self {
        case .forecast(city: _, days: _):
            return "/forecast.json"
        }
    }

    var method: Moya.Method {
        switch self {
        case .forecast(city: _, days: _):
            return .post
        }
    }

    var task: Task {
        switch self {
        case .forecast(city: let city, days: let days):
            let param: [String: Any] = [
                "q": city,
                "days": days,
                "key": NetworkDefault.apiKey
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
}
