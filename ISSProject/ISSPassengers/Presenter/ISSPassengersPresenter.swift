//
//  ISSPassengersPresenter.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPassengersPresenter: ISSPassengersPresenterProtocol {
    var interactor: ISSPassengersInteractorProtocol?
    
    weak var view: ISSPassengersViewControllerProtocol?
    
    func fetchPassengers() {
        interactor?.fetchPassengers()
    }
    
    func didFinishFetchingPassengres(passengers: [String]) {
        view?.setPassengers(passengers: passengers)
    }
    

}

protocol ISSPassengersPresenterProtocol: class {
    var interactor: ISSPassengersInteractorProtocol? { get set}
    var view: ISSPassengersViewControllerProtocol? {get set }
    
    func fetchPassengers()
    func didFinishFetchingPassengres(passengers: [String])
}
