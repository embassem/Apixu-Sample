//
//  FoundationsExtension.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

extension UInt32 {
    init?(hexString: String) {

        let scanner = Scanner(string: hexString)
        var hexInt = UInt32.max
        let success = scanner.scanHexInt32(&hexInt)
        if success {
            self = hexInt
        } else {
            return nil
        }
    }
}

extension Data {

    func sizeInKB() -> Int {
        return NSData (data: self).length / 1024 // in Kilo
    }

    func toBase64String() -> String {
        return self.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

}

extension Int {

    func toPointsFormat() -> String {

        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1_000_000

        if million >= 1.0 {
            return "\(round(million * 10) / 10)M"
        }

        if thousand >= 1.0 {
            return "\(round(thousand * 10) / 10)K"
        }

        return "\(Int(number))"
    }

    func toDistanceFormat() -> String {

        let number = Double(self)

        let thousands = number / 1000

        if thousands >= 1.0 { return "\(round(thousands*10)/10) KM" } else { return "\(Int(number)) M" }
    }
}
