//
//  Location.swift
//  rainyshiny
//
//  Created by Mac on 8/18/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import CoreLocation

class Location {
    static var  sharedInstance = Location
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
