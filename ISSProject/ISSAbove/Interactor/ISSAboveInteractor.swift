//
//  ISSAboveInteractor.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation
import CoreLocation

class ISSAboveInteractor: ISSAboveInteractorProtocol {
    weak var presenter: ISSAbovePresenterProtocol?
    var apiWorker: LiveLocationWorker
    var locationService: LocationService?
    
    required init(withApiWorker apiWorker:LiveLocationWorker) {
        self.apiWorker = apiWorker
        locationService = LocationService()
        locationService?.delegate = self
    }
    
    func CheckIfAbove(location: CLLocation) {
        apiWorker.fetchLiveLocationWS(completion: { (_location) in
            let _location = Location(location: _location)
            let issLocation = LocationHelper.locationToMapLocation(loc: _location)
            let distanceInMeters = issLocation.distance(from: location)
            let status = distanceInMeters >= 10000 ? false : true
            self.presenter?.didFinishCheckingIfAbove(status: status)
        })
    }
    
    func getCurrentLocation() {
        locationService?.requestPermissions()
    }
}

extension ISSAboveInteractor: LocationServiceDelegate {
    func getLocationDidSucced(location: CLLocation) {
        CheckIfAbove(location: location)
    }
}

protocol ISSAboveInteractorProtocol: class {
    var presenter: ISSAbovePresenterProtocol? { get set}
    func CheckIfAbove(location: CLLocation)
    func getCurrentLocation()
}
