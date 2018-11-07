//
//  HomeProtocols.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - ViewController -> Presenter

protocol HomePresenterProtocol: class {

    var interactor: HomeInteractorInputProtocol? { get set }

    /* ViewController -> Presenter */

    func viewDidLoad()
}

protocol HomeInteractorInputProtocol: class {

    var presenter: HomeInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func fetchLocation()
    func fetchWeather(city: String)
}

// MARK: - Interactor -> Presenter

protocol HomeInteractorOutputProtocol: class {

    /* Interactor -> Presenter */

    func fetchedLocation(location: CLLocation, place: CLPlacemark)
    func failedToFetchLocation(error: Error)

    func fetchedWither(result: ApixuBase)
    func failedToFetchWeather(error: ErrorModel?)
}

// MARK: - Presenter -> ViewController

protocol HomeViewProtocol: class {

    var presenter: HomePresenterProtocol? { get set }

    /* Presenter -> ViewController */

    func display(result: ApixuBase)

    func showError(message: String)
}

// MARK: - Router

protocol HomeWireframeProtocol: class {

}
