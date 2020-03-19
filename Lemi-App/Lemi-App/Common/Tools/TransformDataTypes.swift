//
//  TransformDataTypes.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright © 2020 Xander Mercado. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TransformString: TransformType {
    public typealias Object = String
    public typealias JSON = Any?

    public init() {}

    public func transformFromJSON(_ value: Any?) -> String? {
        
        var result: String?

        guard let json = value else { return result }
        
        if json is String {
            result = (json as! String)
        }

        if json is Int {
            guard let transformedString = json as? Int else { return result }
            result = "\(transformedString)"
        }
        
        if json is Double {
            guard let transformedString = json as? Double else { return result }
            result = "\(transformedString)"
        }

        return result
    }

    public func transformToJSON(_ value: String?) -> Any?? {
        guard let object = value else { return nil }
        return String(object)
    }
}

public class TransformInt: TransformType {

    public typealias Object = Int
    public typealias JSON = Any?

    public init() {}

    public func transformFromJSON(_ value: Any?) -> Int? {
        
        var result: Int?
        
        guard let json = value else { return result }
        
        if json is Int {
            result = (json as! Int)
        }
        
        if json is Double {
            guard let transformedDouble = json as? Double else { return result }
            result = Int(transformedDouble)
        }
        
        if json is String {
            guard let transformedString = json as? String else { return result }
            guard let transformedInt = Int(transformedString) else { return result }
            result = transformedInt
        }
        
        return result
    }

    public func transformToJSON(_ value: Int?) -> Any?? {
        guard let object = value else { return nil }
        return String(object)
    }
}
