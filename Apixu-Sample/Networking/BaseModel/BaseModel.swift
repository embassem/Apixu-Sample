//
//	BaseModel.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import Foundation
import ObjectMapper

open class BaseModel: NSObject, NSCoding, Mappable {

    public var code: String?
    public var status: String?
    public var message: String?
    public var isSuccessful:Bool?
    public var count:Int?
    class func newInstance(map: Map) -> Mappable? {
        return BaseModel()
    }
    required public init?(map: Map) {}
    override init() {}

    open func mapping(map: Map) {

        status <- map["status"]
        code <- map["code"]
        message <- map["Message"]
        isSuccessful <- map ["IsSuccessful"]
        count <- map ["Count"]
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc public required init(coder aDecoder: NSCoder) {

        code = aDecoder.decodeObject(forKey: "code") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc public func encode(with aCoder: NSCoder) {

        if code != nil {
            aCoder.encode(code, forKey: "code")
        }
        if status != nil {
            aCoder.encode(status, forKey: "status")
        }
    }

}
