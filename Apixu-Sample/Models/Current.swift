//
//	Current.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Current : NSObject, NSCoding, Mappable{

	var cloud : Int?
	var condition : Condition?
	var feelslikeC : Float?
	var feelslikeF : Float?
	var humidity : Int?
	var isDay : Int?
	var lastUpdated : String?
	var lastUpdatedEpoch : Int?
	var precipIn : Float?
	var precipMm : Float?
	var pressureIn : Float?
	var pressureMb : Float?
	var tempC : Float?
	var tempF : Float?
	var uv : Float?
	var visKm : Float?
	var visMiles : Float?
	var windDegree : Int?
	var windDir : String?
	var windKph : Float?
	var windMph : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Current()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		cloud <- map["cloud"]
		condition <- map["condition"]
		feelslikeC <- map["feelslike_c"]
		feelslikeF <- map["feelslike_f"]
		humidity <- map["humidity"]
		isDay <- map["is_day"]
		lastUpdated <- map["last_updated"]
		lastUpdatedEpoch <- map["last_updated_epoch"]
		precipIn <- map["precip_in"]
		precipMm <- map["precip_mm"]
		pressureIn <- map["pressure_in"]
		pressureMb <- map["pressure_mb"]
		tempC <- map["temp_c"]
		tempF <- map["temp_f"]
		uv <- map["uv"]
		visKm <- map["vis_km"]
		visMiles <- map["vis_miles"]
		windDegree <- map["wind_degree"]
		windDir <- map["wind_dir"]
		windKph <- map["wind_kph"]
		windMph <- map["wind_mph"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cloud = aDecoder.decodeObject(forKey: "cloud") as? Int
         condition = aDecoder.decodeObject(forKey: "condition") as? Condition
         feelslikeC = aDecoder.decodeObject(forKey: "feelslike_c") as? Float
         feelslikeF = aDecoder.decodeObject(forKey: "feelslike_f") as? Float
         humidity = aDecoder.decodeObject(forKey: "humidity") as? Int
         isDay = aDecoder.decodeObject(forKey: "is_day") as? Int
         lastUpdated = aDecoder.decodeObject(forKey: "last_updated") as? String
         lastUpdatedEpoch = aDecoder.decodeObject(forKey: "last_updated_epoch") as? Int
         precipIn = aDecoder.decodeObject(forKey: "precip_in") as? Float
         precipMm = aDecoder.decodeObject(forKey: "precip_mm") as? Float
         pressureIn = aDecoder.decodeObject(forKey: "pressure_in") as? Float
         pressureMb = aDecoder.decodeObject(forKey: "pressure_mb") as? Float
         tempC = aDecoder.decodeObject(forKey: "temp_c") as? Float
         tempF = aDecoder.decodeObject(forKey: "temp_f") as? Float
         uv = aDecoder.decodeObject(forKey: "uv") as? Float
         visKm = aDecoder.decodeObject(forKey: "vis_km") as? Float
         visMiles = aDecoder.decodeObject(forKey: "vis_miles") as? Float
         windDegree = aDecoder.decodeObject(forKey: "wind_degree") as? Int
         windDir = aDecoder.decodeObject(forKey: "wind_dir") as? String
         windKph = aDecoder.decodeObject(forKey: "wind_kph") as? Float
         windMph = aDecoder.decodeObject(forKey: "wind_mph") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cloud != nil{
			aCoder.encode(cloud, forKey: "cloud")
		}
		if condition != nil{
			aCoder.encode(condition, forKey: "condition")
		}
		if feelslikeC != nil{
			aCoder.encode(feelslikeC, forKey: "feelslike_c")
		}
		if feelslikeF != nil{
			aCoder.encode(feelslikeF, forKey: "feelslike_f")
		}
		if humidity != nil{
			aCoder.encode(humidity, forKey: "humidity")
		}
		if isDay != nil{
			aCoder.encode(isDay, forKey: "is_day")
		}
		if lastUpdated != nil{
			aCoder.encode(lastUpdated, forKey: "last_updated")
		}
		if lastUpdatedEpoch != nil{
			aCoder.encode(lastUpdatedEpoch, forKey: "last_updated_epoch")
		}
		if precipIn != nil{
			aCoder.encode(precipIn, forKey: "precip_in")
		}
		if precipMm != nil{
			aCoder.encode(precipMm, forKey: "precip_mm")
		}
		if pressureIn != nil{
			aCoder.encode(pressureIn, forKey: "pressure_in")
		}
		if pressureMb != nil{
			aCoder.encode(pressureMb, forKey: "pressure_mb")
		}
		if tempC != nil{
			aCoder.encode(tempC, forKey: "temp_c")
		}
		if tempF != nil{
			aCoder.encode(tempF, forKey: "temp_f")
		}
		if uv != nil{
			aCoder.encode(uv, forKey: "uv")
		}
		if visKm != nil{
			aCoder.encode(visKm, forKey: "vis_km")
		}
		if visMiles != nil{
			aCoder.encode(visMiles, forKey: "vis_miles")
		}
		if windDegree != nil{
			aCoder.encode(windDegree, forKey: "wind_degree")
		}
		if windDir != nil{
			aCoder.encode(windDir, forKey: "wind_dir")
		}
		if windKph != nil{
			aCoder.encode(windKph, forKey: "wind_kph")
		}
		if windMph != nil{
			aCoder.encode(windMph, forKey: "wind_mph")
		}

	}

}