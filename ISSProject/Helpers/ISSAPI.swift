//
//  ISSAPI.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

struct ISSAPI {
    static let urlGetLiveLocation = "http://api.open-notify.org/iss-now.json"
    static let urlGetPassengerList = "http://api.open-notify.org/astros.json"
    static let urlGetIssCurrentTime = "http://api.open-notify.org/iss-pass.json"
}

import Foundation

struct PasseTimeConstants {
    
    static let longitudeKey = "lon"
    static let latitudeKey = "lat"
    static let atitudeKey = "alt"
    
}
