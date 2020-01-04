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
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"] as! [[String:Any]])
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let buildings = try! decoder.decode([Building].self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(buildings)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func getABuilding(buildingId: Int, completion: @escaping (Building) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "location/\(buildingId)")
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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let building = try! jsonDecoder.decode(Building.self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(building)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func postLogin(email: String, password: String, completion: @escaping (Bool) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string: WebService.server + "user/login")
            else {
                fatalError("url is not valid")
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = "{ \"email\" : \"\(email)\", \"password\" : \"\(password)\"}"
        request.httpBody = parameters.data(using: String.Encoding.utf8);
        URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    if let result = dictionary["success"] as? Bool {
                        if result {
                            keyChainService.save(dictionary["access_token"] as! String, for: "access_token")
                        }
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }.resume()
    }
    
    func getEvents(completion: @escaping ([Event]) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "event")
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
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let events = try! jsonDecoder.decode([Event].self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(events)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func getAnEvent(eventId: Int,completion: @escaping (Event) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "event/\(eventId)")
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
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let event = try! jsonDecoder.decode(Event.self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(event)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func getSensorsFromRoom(roomId: Int, completion: @escaping ([Sensor]?) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "room/\(roomId)")
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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let room = try! jsonDecoder.decode(Room.self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(room.sensors)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func getASensor(sensorId: Int, completion: @escaping (Sensor) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "sensor/\(sensorId)")
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
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let dataa = dictionary["data"] as? [String: Any]
                    let jsonData = try JSONSerialization.data(withJSONObject: dataa!["sensor"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let sensor = try! jsonDecoder.decode(Sensor.self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(sensor)
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
    
    func getInformations(completion: @escaping (Information?) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string : WebService.server + "general/count")
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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["data"])
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategyFormatters = [DateFormatter.standard]
                    let information = try! jsonDecoder.decode(Information.self,  from: jsonData)
                    DispatchQueue.main.async {
                        completion(information)
                    }
                }
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
}
