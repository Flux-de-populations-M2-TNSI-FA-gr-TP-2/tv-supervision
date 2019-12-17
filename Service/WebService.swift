//
//  WebService.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 17/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

class WebService {
    
    static var server: String = "https://fluxtnsi.ddns.net/api/";
    
    func getAllBuildings(completion: @escaping ([Building]) -> ()){
        let keyChainService = KeyChainService()
        print("call api service")
        guard let url = URL(string : WebService.server + "location/")
            else {
                fatalError("url is wrong !!!")
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let token = keyChainService.retriveToken(for: "access_token")
        request.setValue("Bearer " + token!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                print("jsonData : \(String(decoding:data!, as: UTF8.self))" )
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json \(json)")
                if let dictionary = json as? [String: Any] {
                    print("json \(dictionary)")
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"] as! [[String:Any]])
                    let buildings = try! JSONDecoder().decode([Building].self,  from: jsonData)
                    print("buildings extract : \(buildings)")
                    DispatchQueue.main.async {
                        completion(buildings)
                    }
                }

            } catch let error as NSError {
                print(error)
            }
                                        
        }.resume()
    }
}
