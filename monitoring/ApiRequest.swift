//
//  ApiRequest.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 11/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

class ApiRequest {
    
    static var server: String = "https://fluxtnsi.ddns.net/api/";
    
    /*static public func callApi(url: String, method: String, header: String, body: String) -> String {
        // on crée l'url pour interroger l'API
        let url = ApiRequest.server + url;
        let request = NSMutableURLRequest(url: URL(string: url)!)
        var result: String = ""
        // on définit la méthode utilisée
        request.httpMethod = method
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if(error != nil){
                print("erreur api :" );
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Erreur status réponse : \(httpStatus.statusCode)")
                print("réponse : \(response)")
            }
            if(error == nil) {
                result = String(decoding:data!, as: UTF8.self)
            }
        }
        requestAPI.resume()
        return result
    }*/
    
}
