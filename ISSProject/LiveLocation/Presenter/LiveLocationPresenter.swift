//
//  LiveLocationPresenter.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class LiveLocationPresenter: LiveLocationPresenterProtocol {
    weak var view: LiveLocationViewControllerProtocol?
    var interactor: LiveLocationInteractorProtocol?
    
    func fetchLiveLocation() {
        interactor?.fetchTopHeadlines()
    }
    func didFinishFetchingLocation(location: Location){
        view?.centerMapOnLocation(location: location)
    }
}

protocol LiveLocationPresenterProtocol: class {
    var interactor: LiveLocationInteractorProtocol? { get set}
    var view: LiveLocationViewControllerProtocol? {get set }

    func fetchLiveLocation()
    func didFinishFetchingLocation(location: Location)
}
