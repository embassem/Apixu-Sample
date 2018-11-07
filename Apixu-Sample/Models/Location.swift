//
//	Location.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class Location: NSObject, NSCoding, Mappable {

    var country: String?
    var lat: Float?
    var localtime: String?
    var localtimeEpoch: Int?
    var lon: Float?
    var name: String?
    var region: String?
    var tzId: String?

    class func newInstance(map: Map) -> Mappable? {
        return Location()
    }
    required init?(map: Map) {}
    private override init() {}

    func mapping(map: Map) {
        country <- map["country"]
        lat <- map["lat"]
        localtime <- map["localtime"]
        localtimeEpoch <- map["localtime_epoch"]
        lon <- map["lon"]
        name <- map["name"]
        region <- map["region"]
        tzId <- map["tz_id"]

    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        country = aDecoder.decodeObject(forKey: "country") as? String
        lat = aDecoder.decodeObject(forKey: "lat") as? Float
        localtime = aDecoder.decodeObject(forKey: "localtime") as? String
        localtimeEpoch = aDecoder.decodeObject(forKey: "localtime_epoch") as? Int
        lon = aDecoder.decodeObject(forKey: "lon") as? Float
        name = aDecoder.decodeObject(forKey: "name") as? String
        region = aDecoder.decodeObject(forKey: "region") as? String
        tzId = aDecoder.decodeObject(forKey: "tz_id") as? String

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if country != nil {
            aCoder.encode(country, forKey: "country")
        }
        if lat != nil {
            aCoder.encode(lat, forKey: "lat")
        }
        if localtime != nil {
            aCoder.encode(localtime, forKey: "localtime")
        }
        if localtimeEpoch != nil {
            aCoder.encode(localtimeEpoch, forKey: "localtime_epoch")
        }
        if lon != nil {
            aCoder.encode(lon, forKey: "lon")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if region != nil {
            aCoder.encode(region, forKey: "region")
        }
        if tzId != nil {
            aCoder.encode(tzId, forKey: "tz_id")
        }

    }

}
