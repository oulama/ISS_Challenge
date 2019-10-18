//
//  ISSAboveViewController.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import UIKit

class ISSAboveViewController: UIViewController, ISSAboveViewControllerProtocol {
    var presenter: ISSAbovePresenterProtocol?
    
    @IBOutlet weak var statusColor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.checkISSAbove()
        ISSAboveBuilder.buildModule(arroundView: self)
        // Do any additional setup after loading the view.
    }
    func setStatus(status: Bool) {
        DispatchQueue.main.async {
            self.statusColor.backgroundColor = status ? UIColor.green : UIColor.red
        }
    }

}
protocol ISSAboveViewControllerProtocol: class {
    var presenter: ISSAbovePresenterProtocol? { get set}
    func setStatus(status: Bool)
}
