//
//	Day.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Day : NSObject, NSCoding, Mappable{

	var avghumidity : Float?
	var avgtempC : Float?
	var avgtempF : Float?
	var avgvisKm : Float?
	var avgvisMiles : Float?
	var condition : Condition?
	var maxtempC : Float?
	var maxtempF : Float?
	var maxwindKph : Float?
	var maxwindMph : Float?
	var mintempC : Float?
	var mintempF : Float?
	var totalprecipIn : Float?
	var totalprecipMm : Float?
	var uv : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Day()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		avghumidity <- map["avghumidity"]
		avgtempC <- map["avgtemp_c"]
		avgtempF <- map["avgtemp_f"]
		avgvisKm <- map["avgvis_km"]
		avgvisMiles <- map["avgvis_miles"]
		condition <- map["condition"]
		maxtempC <- map["maxtemp_c"]
		maxtempF <- map["maxtemp_f"]
		maxwindKph <- map["maxwind_kph"]
		maxwindMph <- map["maxwind_mph"]
		mintempC <- map["mintemp_c"]
		mintempF <- map["mintemp_f"]
		totalprecipIn <- map["totalprecip_in"]
		totalprecipMm <- map["totalprecip_mm"]
		uv <- map["uv"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         avghumidity = aDecoder.decodeObject(forKey: "avghumidity") as? Float
         avgtempC = aDecoder.decodeObject(forKey: "avgtemp_c") as? Float
         avgtempF = aDecoder.decodeObject(forKey: "avgtemp_f") as? Float
         avgvisKm = aDecoder.decodeObject(forKey: "avgvis_km") as? Float
         avgvisMiles = aDecoder.decodeObject(forKey: "avgvis_miles") as? Float
         condition = aDecoder.decodeObject(forKey: "condition") as? Condition
         maxtempC = aDecoder.decodeObject(forKey: "maxtemp_c") as? Float
         maxtempF = aDecoder.decodeObject(forKey: "maxtemp_f") as? Float
         maxwindKph = aDecoder.decodeObject(forKey: "maxwind_kph") as? Float
         maxwindMph = aDecoder.decodeObject(forKey: "maxwind_mph") as? Float
         mintempC = aDecoder.decodeObject(forKey: "mintemp_c") as? Float
         mintempF = aDecoder.decodeObject(forKey: "mintemp_f") as? Float
         totalprecipIn = aDecoder.decodeObject(forKey: "totalprecip_in") as? Float
         totalprecipMm = aDecoder.decodeObject(forKey: "totalprecip_mm") as? Float
         uv = aDecoder.decodeObject(forKey: "uv") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if avghumidity != nil{
			aCoder.encode(avghumidity, forKey: "avghumidity")
		}
		if avgtempC != nil{
			aCoder.encode(avgtempC, forKey: "avgtemp_c")
		}
		if avgtempF != nil{
			aCoder.encode(avgtempF, forKey: "avgtemp_f")
		}
		if avgvisKm != nil{
			aCoder.encode(avgvisKm, forKey: "avgvis_km")
		}
		if avgvisMiles != nil{
			aCoder.encode(avgvisMiles, forKey: "avgvis_miles")
		}
		if condition != nil{
			aCoder.encode(condition, forKey: "condition")
		}
		if maxtempC != nil{
			aCoder.encode(maxtempC, forKey: "maxtemp_c")
		}
		if maxtempF != nil{
			aCoder.encode(maxtempF, forKey: "maxtemp_f")
		}
		if maxwindKph != nil{
			aCoder.encode(maxwindKph, forKey: "maxwind_kph")
		}
		if maxwindMph != nil{
			aCoder.encode(maxwindMph, forKey: "maxwind_mph")
		}
		if mintempC != nil{
			aCoder.encode(mintempC, forKey: "mintemp_c")
		}
		if mintempF != nil{
			aCoder.encode(mintempF, forKey: "mintemp_f")
		}
		if totalprecipIn != nil{
			aCoder.encode(totalprecipIn, forKey: "totalprecip_in")
		}
		if totalprecipMm != nil{
			aCoder.encode(totalprecipMm, forKey: "totalprecip_mm")
		}
		if uv != nil{
			aCoder.encode(uv, forKey: "uv")
		}

	}

}