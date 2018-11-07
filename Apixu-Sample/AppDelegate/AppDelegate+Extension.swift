//
//  AppDelegate+Extension.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import UIKit

extension AppDelegate {

    func initApp () {
        initNetworking()
        initLocationService()
    }

}

// MARK: - Constance
extension AppDelegate {

    private func initNetworking () {
        //setting Networking base Url
        NetworkDefault.baseURL = Constant.Networking.baseUrl
        NetworkDefault.apiKey = Constant.Networking.apiKey

    }

}

// MARK: - Services
extension AppDelegate {

    private func initLocationService () {

    }

}
