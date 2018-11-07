//
//	ApixuBase.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ApixuBase : NSObject, NSCoding, Mappable{

	var current : Current?
	var forecast : Forecast?
	var location : Location?


	class func newInstance(map: Map) -> Mappable?{
		return ApixuBase()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		current <- map["current"]
		forecast <- map["forecast"]
		location <- map["location"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         current = aDecoder.decodeObject(forKey: "current") as? Current
         forecast = aDecoder.decodeObject(forKey: "forecast") as? Forecast
         location = aDecoder.decodeObject(forKey: "location") as? Location

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if current != nil{
			aCoder.encode(current, forKey: "current")
		}
		if forecast != nil{
			aCoder.encode(forecast, forKey: "forecast")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}

	}

}