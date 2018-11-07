//
//	Astro.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class Astro: NSObject, NSCoding, Mappable {

    var moonrise: String?
    var moonset: String?
    var sunrise: String?
    var sunset: String?

    class func newInstance(map: Map) -> Mappable? {
        return Astro()
    }
    required init?(map: Map) {}
    private override init() {}

    func mapping(map: Map) {
        moonrise <- map["moonrise"]
        moonset <- map["moonset"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]

    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        moonrise = aDecoder.decodeObject(forKey: "moonrise") as? String
        moonset = aDecoder.decodeObject(forKey: "moonset") as? String
        sunrise = aDecoder.decodeObject(forKey: "sunrise") as? String
        sunset = aDecoder.decodeObject(forKey: "sunset") as? String

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if moonrise != nil {
            aCoder.encode(moonrise, forKey: "moonrise")
        }
        if moonset != nil {
            aCoder.encode(moonset, forKey: "moonset")
        }
        if sunrise != nil {
            aCoder.encode(sunrise, forKey: "sunrise")
        }
        if sunset != nil {
            aCoder.encode(sunset, forKey: "sunset")
        }

    }

}
