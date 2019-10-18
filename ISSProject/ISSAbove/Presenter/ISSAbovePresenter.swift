//
//  ISSAbovePresenter.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation


class ISSAbovePresenter: ISSAbovePresenterProtocol {
    var interactor: ISSAboveInteractorProtocol?
    weak var view: ISSAboveViewControllerProtocol?
    
    func didFinishCheckingIfAbove(status: Bool) {
        view?.setStatus(status: status)
    }

    func checkISSAbove() {
        interactor?.getCurrentLocation()
    }

}

protocol ISSAbovePresenterProtocol: class {
    var interactor: ISSAboveInteractorProtocol? { get set}
    var view: ISSAboveViewControllerProtocol? {get set }
    
    func checkISSAbove()
    func didFinishCheckingIfAbove(status: Bool)
}
