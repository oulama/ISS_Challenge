//
//  ISSPasseTimePresenter.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPasseTimePresenter: ISSPasseTimePresenterProtocol {
    weak var view: ISSPasseTimeViewControllerProtocol?
    
    var interactor: ISSPasseTimeInteractorProtocol?
    
    func fetchPasseTime() {
        interactor?.getPassTimesForLocation()
    }
    
    func didFinishFetchingPasseTime(passeTime: [String]) {
        view?.setPasseTime(passeTime: passeTime)
    }
}

protocol ISSPasseTimePresenterProtocol: class {
    var view: ISSPasseTimeViewControllerProtocol? {get set}
    var interactor: ISSPasseTimeInteractorProtocol? {get set}
    
    func fetchPasseTime()
    func didFinishFetchingPasseTime(passeTime: [String])
}
