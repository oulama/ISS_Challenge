//
//  LocationHelper.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHelper{
    static func locationToMapLocation(loc: Location)-> CLLocation {
        let longitude: String = loc.longitude!
        let latitude: String = loc.latitude!
        let lat = CLLocationDegrees(latitude)
        let long = CLLocationDegrees(longitude)
        let loc = CLLocation(latitude: lat!, longitude: long!)
        return loc
    }
}

protocol LocationServiceDelegate: class {
    func getLocationDidSucced(location: CLLocation)
    //func getLocationDidFail(error: NSError)
}

class LocationService: NSObject {
    
    private let locationManager: CLLocationManager =  CLLocationManager()
    weak var delegate: LocationServiceDelegate?
    func getLocationManager() -> CLLocationManager {
        return locationManager
    }
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    func getLocation() {
        requestPermissions()
        let status = CLLocationManager.authorizationStatus()
        if status == .denied || status == .restricted {
            return
        }
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.requestLocation()
    }
    func requestPermissions() {
        locationManager.requestAlwaysAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Changed Status")
        getLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.first else { return }
        delegate?.getLocationDidSucced(location: loc)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error : \(error.localizedDescription)")
    }
}
