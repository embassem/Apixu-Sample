//
//  UIApplication.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {

    /**
     ### It Open Website Url with Safari Default browser ###

     - Parameter urlStr : URL to be open
     - Returns:Void.
     */

    func openURLWithSafariBrowser(urlString: String?) {

        if let urlString = urlString, let url = URL (string: urlString) {

            if #available(iOS 10.0, *) {
                self.open(url, options: [:], completionHandler: nil)
            } else {
                self.openURL(url)
            }
        }
    }

    func callA(number: String?) {

        if let numberItSelf = number ,
            let callingURL = URL (string: "tel://\(numberItSelf)") {

            if #available(iOS 10.0, *) {
                self.open(callingURL, options: [:], completionHandler: nil)
            } else {
                self.openURL(callingURL)
            }
        }
    }

    /**
     ### It Opens Map Application ###

     it check if the device has google Maps app
     if not then it opens apple default maps app

     - Parameter latitude : coodrinate
     - Parameter longitude : coordinate
     - Returns:Void.
     */

    func openMapsApp(latitude: Float?, longitude: Float?) {

        guard latitude != nil && longitude != nil else { return }

        if let googleMapsAppSchemaURL = URL (string: "comgooglemaps://") ,
            let googleMapsAppURL = URL (string: "comgooglemaps://?center=\(latitude!),\(longitude!)&q=\(latitude!),\(longitude!)") ,

            let appleMapsAppSchemaURL = URL (string: "http://maps.apple.com") ,
            let appleMapsApURL = URL (string: "http://maps.apple.com/?daddr=\(latitude!),\(longitude!)") {

            //open goole maps App
            if self.canOpenURL(googleMapsAppSchemaURL) {

                if #available(iOS 10.0, *) {
                    self.open(googleMapsAppURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    self.openURL(googleMapsAppURL)
                }
            } else {
                //open apple maps App
                if self.canOpenURL(appleMapsAppSchemaURL) {

                    if #available(iOS 10.0, *) {
                        self.open(appleMapsApURL, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                        self.openURL(appleMapsApURL)
                    }
                }
            }
        }
    }

    func goToAppSettings() {

        if let locationSettingsUrl = URL(string: UIApplication.openSettingsURLString) {
            self.open(locationSettingsUrl, options: [:], completionHandler: nil)
        }
    }
}
