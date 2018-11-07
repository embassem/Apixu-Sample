//
//  NetworkDefault.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import Foundation
public struct NetworkDefault {
    static public  let pageCount: Int = 10
    static public  let timeoutIntervalForRequest: TimeInterval = 30 // as seconds, you can set your request timeout
    static public  let timeoutIntervalForResource: TimeInterval = 30
    static public  var baseURL = ""
    static public  var imageURL = ""
    static public  var verbose = true
    static public  var apiKey = ""
    static public var  accessToken: (() -> String)?
}
