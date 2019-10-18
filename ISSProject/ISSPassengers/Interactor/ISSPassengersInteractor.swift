//
//  ISSPassengersInteractor.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPassengersInteractor: ISSPassengersInteractorProtocol {
    weak var presenter: ISSPassengersPresenterProtocol?
    var apiWorker: ISSPassengersWorker
    
    required init(withApiWorker apiWorker:ISSPassengersWorker) {
        self.apiWorker = apiWorker
    }
    
    func fetchPassengers() {
        var passengers: [String] = []
        apiWorker.fetchPassengersWS(completion: { (_passengers) in
            for passenger in _passengers as [[String: Any]]{
                let pass = passenger["name"] as! String
                passengers.append(pass)
            }
            self.presenter?.didFinishFetchingPassengres(passengers: passengers)
        })
    }
}

protocol ISSPassengersInteractorProtocol: class {
    var presenter: ISSPassengersPresenterProtocol? { get set}
    func fetchPassengers()
}
