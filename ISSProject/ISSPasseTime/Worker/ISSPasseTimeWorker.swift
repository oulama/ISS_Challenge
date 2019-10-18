//
//  ISSPasseTimeWorker.swift
//  ISSProject
//
//  Created by DOUMARI HAMZA on 10/18/19.
//  Copyright © 2019 DOUMARI HAMZA. All rights reserved.
//

import Foundation

class ISSPasseTimeWorker: ISSPasseTimeWorkerProtocol {
    var givenNumberOfTimes = 10
    var givenAtitude = 10000
    let defaultSession = URLSession(configuration: .default)
    
    func fetchPassengersWS(longitude: Double, latitude: Double, completion: @escaping ([[String : Any]]) -> Void) {
        var url = URLComponents(string: ISSAPI.urlGetIssCurrentTime)
        let requestParams: [String: Double] = [PasseTimeConstants.longitudeKey: longitude, PasseTimeConstants.latitudeKey: latitude, "n": Double(givenNumberOfTimes), PasseTimeConstants.atitudeKey: Double(givenAtitude)]
        var items = [URLQueryItem]()
        for (key, value) in requestParams {
            items.append(URLQueryItem(name: key, value: value.description))
        }
        url?.queryItems = items
        guard let queryURL = url?.url else { return }
        defaultSession.dataTask(with: queryURL) { (data, response, error) in
            
            if error == nil,let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let passeTime = json["response"] as! [[String: Any]]
                    completion(passeTime)
                }catch{
                    return
                }
            }
            }.resume()
    }
}

protocol ISSPasseTimeWorkerProtocol: class {
    func fetchPassengersWS(longitude: Double, latitude: Double, completion: @escaping ([[String: Any]]) -> Void)
}
