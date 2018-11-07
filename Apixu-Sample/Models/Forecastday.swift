//
//	Forecastday.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Forecastday : NSObject, NSCoding, Mappable{

	var astro : Astro?
	var date : String?
	var dateEpoch : Int?
	var day : Day?


	class func newInstance(map: Map) -> Mappable?{
		return Forecastday()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		astro <- map["astro"]
		date <- map["date"]
		dateEpoch <- map["date_epoch"]
		day <- map["day"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         astro = aDecoder.decodeObject(forKey: "astro") as? Astro
         date = aDecoder.decodeObject(forKey: "date") as? String
         dateEpoch = aDecoder.decodeObject(forKey: "date_epoch") as? Int
         day = aDecoder.decodeObject(forKey: "day") as? Day

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if astro != nil{
			aCoder.encode(astro, forKey: "astro")
		}
		if date != nil{
			aCoder.encode(date, forKey: "date")
		}
		if dateEpoch != nil{
			aCoder.encode(dateEpoch, forKey: "date_epoch")
		}
		if day != nil{
			aCoder.encode(day, forKey: "day")
		}

	}

}