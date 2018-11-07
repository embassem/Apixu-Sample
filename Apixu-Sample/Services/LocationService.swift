//
//  LocationService.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func didUpdateWithLocation(location: CLLocation)
    func didFailtoUpdateLocation(error: Error)

}

class LocationService: NSObject {

    var lastKnownLocation: CLLocation? {
        didSet {
            if let lastLocation = lastKnownLocation {
                delegate.didUpdateWithLocation(location: lastLocation)
            }
        }
    }
    private var delegate: LocationServiceDelegate

    init(delegate: LocationServiceDelegate) {
        self.delegate = delegate
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.activityType = .other
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters // no nned for more accuracy in wather app
        return manager
    }()

    func updateLocation() {
        locationManager.requestLocation()
    }

    func geoCodeLocation(location: CLLocation, completionHandler: @escaping CLGeocodeCompletionHandler) {
        CLGeocoder().reverseGeocodeLocation(location) { (places, error) in
            if let error = error {
                print("geocode with error :\(error)")
            }
            completionHandler(places, error)

        }
    }
}

extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation

        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        self.lastKnownLocation = locations.last
        manager.stopUpdatingLocation()

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
        delegate.didFailtoUpdateLocation(error: error)
    }

}
