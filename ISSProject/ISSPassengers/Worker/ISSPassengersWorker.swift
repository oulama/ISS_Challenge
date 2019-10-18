//
//  ISSPassengersWorker.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPassengersWorker: ISSPassengersWorkerProtocol {
    let defaultSession = URLSession(configuration: .default)
    func fetchPassengersWS(completion: @escaping ([[String: Any]]) -> Void) {
        guard let requestURL = URL(string: ISSAPI.urlGetPassengerList) else { return }
        defaultSession.dataTask(with: requestURL) { (data, response, error) in
            
            if error == nil,let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let location = json["people"] as! [[String: Any]]
                    completion(location)
                }catch{
                    return
                }
            }
        }.resume()
    }
}

protocol ISSPassengersWorkerProtocol: class {
    func fetchPassengersWS(completion: @escaping ([[String: Any]]) -> Void)
}
