//
//  ISSPasseTimeInteractor.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation
import CoreLocation

class ISSPasseTimeInteractor: ISSPasseTimeInteractorProtocol{
    weak var presenter: ISSPasseTimePresenterProtocol?
    
    var apiWorker: ISSPasseTimeWorker
    var locationService: LocationService?
    
    required init(withApiWorker apiWorker:ISSPasseTimeWorker) {
        self.apiWorker = apiWorker
        locationService = LocationService()
        locationService?.delegate = self
    }
    
    func getPassTimesForLocation() {
        locationService?.requestPermissions()
    }
    
    func fetchPasseTime(long: Double, lat: Double) {
        var passeTimes: [String] = []
        apiWorker.fetchPassengersWS(longitude: long, latitude: lat) { (_passeTimes) in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, h:mm a"
            let timesList = _passeTimes as! [[String : Int]]
            for passeTime in timesList {
                let date = NSDate(timeIntervalSince1970: Double(passeTime["risetime"]!))
                let formattedDate = formatter.string(from: date as Date)
                passeTimes.append(formattedDate)
            }
            self.presenter?.didFinishFetchingPasseTime(passeTime: passeTimes)
            
        }
    }
}

extension ISSPasseTimeInteractor: LocationServiceDelegate {
    func getLocationDidSucced(location: CLLocation) {
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        fetchPasseTime(long: longitude, lat: latitude)
    }
}

protocol ISSPasseTimeInteractorProtocol: class {
    var presenter: ISSPasseTimePresenterProtocol? {get set}
    func fetchPasseTime(long: Double, lat: Double)
    func getPassTimesForLocation()
}
