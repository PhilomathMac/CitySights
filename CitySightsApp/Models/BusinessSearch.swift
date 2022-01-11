//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/11/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    
    var total = 0
    
    var region = Region()
}


struct Region: Decodable {
    var center = Coordinate()
}
