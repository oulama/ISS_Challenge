//
//  ISSPassengersBuilder.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPassengersBuilder {
    static func buildModule(arroundView view:ISSPassengersViewControllerProtocol) {
        
        //MARK: Initialise components.
        let presenter = ISSPassengersPresenter()
        let interactor = ISSPassengersInteractor(withApiWorker: ISSPassengersWorker())
        
        //MARK: link Viper components.
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
