//
//  ISSPassengersViewController.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import UIKit

class ISSPassengersViewController: UIViewController, ISSPassengersViewControllerProtocol {

    
    var presenter: ISSPassengersPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var passengers: [String] = []
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        ISSPassengersBuilder.buildModule(arroundView: self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        presenter?.fetchPassengers()
        // Do any additional setup after loading the view.
    }
    
    func setPassengers(passengers: [String]) {
        self.passengers = passengers
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension ISSPassengersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        cell.textLabel?.text = passengers[indexPath.row]
        return cell
    }
    
    
}

protocol ISSPassengersViewControllerProtocol: class {
    var presenter: ISSPassengersPresenterProtocol? { get set}
    func setPassengers(passengers: [String])
}
