//
//  LiveLocationWorker.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/17/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class LiveLocationWorker: LiveLocationWorkerProtocol {
    let defaultSession = URLSession(configuration: .default)
    func fetchLiveLocationWS(completion: @escaping ([String: Any]) -> Void) {
        guard let requestURL = URL(string: ISSAPI.urlGetLiveLocation) else { return }
        defaultSession.dataTask(with: requestURL) { (data, response, error) in
            
            if error == nil,let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let location = json["iss_position"] as! [String: Any]
                    completion(location)
                }catch{
                    return
                }
            }
            }.resume()
    }
}

protocol LiveLocationWorkerProtocol {
    func fetchLiveLocationWS(completion: @escaping ([String: Any]) -> Void)
}
