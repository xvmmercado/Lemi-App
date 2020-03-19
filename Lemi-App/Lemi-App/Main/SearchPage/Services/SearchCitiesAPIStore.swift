//
//  SearchCitiesAPIStore.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright © 2020 Xander Mercado. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchCitiesAPIStore: SearchCitiesStoreProtocol {
    func fetchCities(parameter: [String: Any], completion: @escaping (searchCitiesAPIResponse)) {
        AlamofireManager.manager.request(APIRouter.FetchCities(parameter: parameter)).responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let cities = Mapper<City>().mapArray(JSONObject: value) {
                        completion(SearchCitiesModel.Response(cities: cities, error: false))
                    } else {
                        completion(SearchCitiesModel.Response(cities: nil, error: true))
                    }
                case .failure(let error):
                    debugPrint(error)
                    completion(SearchCitiesModel.Response(cities: nil, error: true))
                }
        }
    }
}
