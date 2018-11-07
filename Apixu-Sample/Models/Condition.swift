//
//	Condition.swift
//
//	Create by Bassem Abbas on 7/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Condition : NSObject, NSCoding, Mappable{

	var code : Int?
	var icon : String?
	var text : String?


	class func newInstance(map: Map) -> Mappable?{
		return Condition()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["code"]
		icon <- map["icon"]
		text <- map["text"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "code") as? Int
         icon = aDecoder.decodeObject(forKey: "icon") as? String
         text = aDecoder.decodeObject(forKey: "text") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if text != nil{
			aCoder.encode(text, forKey: "text")
		}

	}

}