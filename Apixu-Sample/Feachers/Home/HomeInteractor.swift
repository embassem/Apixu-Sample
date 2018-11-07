//
//  HomeInteractor.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit
import CoreLocation

class HomeInteractor: HomeInteractorInputProtocol {

    weak var presenter: HomeInteractorOutputProtocol?
    lazy var locationService: LocationService = { return LocationService(delegate: self) }()

    var knownLocation: CLLocation? {
        didSet {
            geocodeLocation()
        }
    }
    var place: CLPlacemark? {

        didSet {
            guard let location = knownLocation, let place = place else { return }
            presenter?.fetchedLocation(location: location, place: place)
        }
    }
    init() {

        locationService.updateLocation()
    }

    func fetchLocation() {
        locationService.updateLocation()
    }

    func fetchWeather(city: String) {
        NetworkService.shared.getForecast(city: city) { (result, _, _, _, _) in

            switch result {
            case let .success(response):
                if let genaricResponse = response as? ApixuBase {

                    self.presenter?.fetchedWither(result: genaricResponse)
                } else {
                    //TODO: missing senario
                }
            case let .serverFailure(serverErrors):
                self.presenter?.failedToFetchWeather(error: serverErrors?.first)
            case  let .networkFailure(error):
                guard let nsError = error as? NSError else { break }
                let networkError = ErrorModel(message: nsError.localizedDescription, field: nil, code: nsError.code)
                self.presenter?.failedToFetchWeather(error: networkError)

            }

        }
    }

    private func geocodeLocation() {
        guard let location = knownLocation else {
            return
        }
        locationService.geoCodeLocation(location: location) { (places, _) in
            self.place = places?.first
        }
    }

}

extension HomeInteractor: LocationServiceDelegate {
    func didUpdateWithLocation(location: CLLocation) {
        self.knownLocation = location
    }

    func didFailtoUpdateLocation(error: Error) {
        presenter?.failedToFetchLocation(error: error)
    }

}
