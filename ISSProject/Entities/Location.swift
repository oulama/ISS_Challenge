//
//  Location.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class Location {
    let longitude: String?
    let latitude: String?
    
    init(location: [String: Any]) {
        longitude = location["longitude"] as? String
        latitude = location["latitude"] as? String
    }
}
