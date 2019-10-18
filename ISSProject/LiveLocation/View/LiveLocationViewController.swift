//
//  LiveLocationViewController.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import UIKit
import MapKit

class LiveLocationViewController: UIViewController, LiveLocationViewControllerProtocol  {
    @IBOutlet weak var mapView: MKMapView!
    var presenter: LiveLocationPresenterProtocol?
    var timer: Timer? = nil
    let regionRadius: CLLocationDistance = 10000000
    var issPosition: MKPointAnnotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        LiveLocationBuilder.buildModule(arroundView: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(fetchPosition), userInfo: nil, repeats: true)
    }
    @objc func fetchPosition() {
        presenter?.fetchLiveLocation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    func centerMapOnLocation(location: Location) {
        if let latitude = location.latitude, let longitude = location.longitude{
            let initialLocation = LocationHelper.locationToMapLocation(loc: location)
            issPosition.coordinate = initialLocation.coordinate
            issPosition.title = "iss_position"
            if let anotation = mapView.annotations.first { mapView.removeAnnotation(anotation) }
            mapView.addAnnotation(issPosition)
            mapView.isZoomEnabled = true
            let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    }

}

protocol LiveLocationViewControllerProtocol: class {
    var presenter: LiveLocationPresenterProtocol? { get set}
    func centerMapOnLocation(location: Location)
}
