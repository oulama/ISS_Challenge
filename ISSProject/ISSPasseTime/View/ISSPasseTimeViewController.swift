//
//  ISSPasseTimeViewController.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import UIKit

class ISSPasseTimeViewController: UIViewController, ISSPasseTimeViewControllerProtocol {
    var presenter: ISSPasseTimePresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var passeTime: [String] = []
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        ISSPasseTimeBuilder.buildModule(arroundView: self)
        setupTableView()
        presenter?.fetchPasseTime()

        // Do any additional setup after loading the view.
    }
    
    func setPasseTime(passeTime: [String]) {
        self.passeTime = passeTime
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
}

extension ISSPasseTimeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passeTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        cell.textLabel?.text = passeTime[indexPath.row]
        return cell
    }
    
    
}

protocol ISSPasseTimeViewControllerProtocol: class {
    var presenter: ISSPasseTimePresenterProtocol? {get set}
    func setPasseTime(passeTime: [String])
}
