//
//  LiveLocationInteractor.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class LiveLocationInteractor: LiveLocationInteractorProtocol {
    weak var presenter: LiveLocationPresenterProtocol?
    
    var apiWorker: LiveLocationWorker
    required init(withApiWorker apiWorker:LiveLocationWorker) {
        self.apiWorker = apiWorker
    }
    
    func fetchTopHeadlines() {
        apiWorker.fetchLiveLocationWS(completion: { (_location) in
            let location = Location(location: _location)
            self.presenter?.didFinishFetchingLocation(location: location)
        })
    }
}

protocol LiveLocationInteractorProtocol: class {
    var presenter: LiveLocationPresenterProtocol? { get set}
    func fetchTopHeadlines()
}
