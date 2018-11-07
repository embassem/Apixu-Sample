//
//	Forecast.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Forecast : NSObject, NSCoding, Mappable{

	var forecastday : [Forecastday]?


	class func newInstance(map: Map) -> Mappable?{
		return Forecast()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		forecastday <- map["forecastday"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         forecastday = aDecoder.decodeObject(forKey: "forecastday") as? [Forecastday]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if forecastday != nil{
			aCoder.encode(forecastday, forKey: "forecastday")
		}

	}

}