//
//  ISSPasseTimeBuilder.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPasseTimeBuilder {
    static func buildModule(arroundView view:ISSPasseTimeViewControllerProtocol) {
        
        //MARK: Initialise components.
        let presenter = ISSPasseTimePresenter()
        let interactor = ISSPasseTimeInteractor(withApiWorker: ISSPasseTimeWorker())
        
        //MARK: link Viper components.
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
