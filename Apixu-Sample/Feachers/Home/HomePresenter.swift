//
//  HomePresenter.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import CoreLocation

class HomePresenter: HomePresenterProtocol {

    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol

    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router

    }

    func viewDidLoad() {
        interactor?.fetchLocation()
    }

}

extension HomePresenter: HomeInteractorOutputProtocol {

    func failedToFetchLocation(error: Error) {
        view?.showError(message: error.localizedDescription)
    }

    func fetchedLocation(location: CLLocation, place: CLPlacemark) {
        guard let city = place.administrativeArea else { return }
        interactor?.fetchWeather(city: city)
    }

    func fetchedWither(result: ApixuBase) {

        view?.display(result: result)

    }

    func failedToFetchWeather(error: ErrorModel?) {
        if let message = error?.message {
            view?.showError(message: message )
        }
    }

}
