//
//  LiveLocationBuilder.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class LiveLocationBuilder {
    static func buildModule(arroundView view:LiveLocationViewControllerProtocol) {
        
        //MARK: Initialise components.
        let presenter = LiveLocationPresenter()
        let interactor = LiveLocationInteractor(withApiWorker: LiveLocationWorker())
        
        //MARK: link Viper components.
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
