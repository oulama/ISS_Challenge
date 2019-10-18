//
//  ISSAboveBuilder.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSAboveBuilder {
    static func buildModule(arroundView view:ISSAboveViewControllerProtocol) {
        
        //MARK: Initialise components.
        let presenter = ISSAbovePresenter()
        let interactor = ISSAboveInteractor(withApiWorker: LiveLocationWorker())
        
        //MARK: link Viper components.
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
