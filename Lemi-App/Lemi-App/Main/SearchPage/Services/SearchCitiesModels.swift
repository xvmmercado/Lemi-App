//
//  SearchCitiesModels.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright (c) 2020 Xander Mercado. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import ObjectMapper
import SwiftyJSON

struct SearchCitiesModel {
    
    // MARK: Object model for API requests
    struct Request: Codable {
        var q: String!
    }
    
    // MARK: Object model for API responses
    struct Response {
        var cities: [City]?
        var error: Bool?
    }
    
    // MARK: Object model for UI rendering
    struct ViewModel {
        var cities: [City]?
    }
}

extension SearchCitiesModel.Request: Mappable {
    
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        q <- map["q"]
    }
    
}

struct City {
    var name: String?
    var subtitle: String?
    var country_code: String?
    var population: Int?
    var type: String?
    var id: String?
    var banner: String?
    var color: String?
}

extension City: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        name <- (map["name"], TransformString())
        subtitle <- (map["subtitle"], TransformString())
        country_code <- (map["country_code"], TransformString())
        population <- (map["population"], TransformInt())
        type <- (map["type"], TransformString())
        id <- (map["id"], TransformString())
        banner <- (map["banner"], TransformString())
        color <- (map["color"], TransformString())
    }
}
