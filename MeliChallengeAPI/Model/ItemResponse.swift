//
//  SearchResult.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 11/06/23.
//

import Foundation
import ObjectMapper

struct ItemResponse: Mappable {
    var results: [Item] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        results <- map["results"]
    }
}
