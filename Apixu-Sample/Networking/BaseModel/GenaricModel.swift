//
//  GenaricModel.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import Foundation
import ObjectMapper

open class GenaricModel<T: Mappable> : BaseModel {

    public var response: T?

    override class func newInstance(map: Map) -> Mappable? {
        return GenaricModel<T>()
    }
    public required init?(map: Map) {
        super.init(map: map)
    }
    override init() {
        super.init()
    }

    init(response: T) {
        super.init()
        self.response = response
    }
    override open func mapping(map: Map) {
        super.mapping(map: map)

        response <- map["Result"]

    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        response = aDecoder.decodeObject(forKey: "Result") as? T

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc override public func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)

        if response != nil {
            aCoder.encode(response, forKey: "Result")
        }

    }
}
open class GenaricArray<T: Mappable> : BaseModel {

    public var response: [T]?

    override class func newInstance(map: Map) -> Mappable? {
        return GenaricArray<T>()
    }
    required public  init?(map: Map) {
        super.init(map: map)
    }
    override init() {
        super.init()
    }

    override open func mapping(map: Map) {
        super.mapping(map: map)
        response <- map["Result"]
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        response = aDecoder.decodeObject(forKey: "Result") as?  [T]

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc override public func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)

        if response != nil {
            aCoder.encode(response, forKey: "Result")
        }

    }
}

open class GenaricType<T: Any> : BaseModel {

    public var response: T?

    override class func newInstance(map: Map) -> Mappable? {
        return GenaricType<T>()
    }
    required public init?(map: Map) {
        super.init(map: map)
    }
    override init() {
        super.init()
    }

    override open func mapping(map: Map) {
        super.mapping(map: map)

        response <- map["Result"]

    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        response = aDecoder.decodeObject(forKey: "Result") as? T

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc override public func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)

        if response != nil {
            aCoder.encode(response, forKey: "Result")
        }

    }
}
