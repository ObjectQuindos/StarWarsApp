//
//  WebServiceManager.swift
//  StarWarsApp
//
//  Created by David López on 28/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import Foundation
import Alamofire

enum BackendError: Error {
    case objectSerialization(reason: String)
    case network(error: Error)
    case apiProvidedError(reason: String)
    case noInternetConnection(reason: String)
}

class WebServiceManager {
    static let sharedInstance = WebServiceManager()
    let manager = Alamofire.SessionManager.default
    
    func getPlanets(idPlanet: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idPlanet)
        Alamofire.request(WebServiceRouter.getPlanets(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    func getPeople(idCharacter: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idCharacter)
        Alamofire.request(WebServiceRouter.getPeople(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    func getSpaceships(idSpaceship: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idSpaceship)
        Alamofire.request(WebServiceRouter.getSpaceships(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    func getVehicles(idVehicle: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idVehicle)
        Alamofire.request(WebServiceRouter.getVehicles(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    func getSpecies(idSpecie: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idSpecie)
        Alamofire.request(WebServiceRouter.getSpecies(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    func getFilms(idFilm: Int, completionHandler: @escaping (Result<[String : Any]>?) -> Void) {
        let idString = String(idFilm)
        Alamofire.request(WebServiceRouter.getFilms(idString)).validate().responseJSON { (response) in
            let result = self.todoFromJsonResponse(response: response)
            completionHandler(result)
        }
    }
    
    private func todoFromJsonResponse(response: DataResponse<Any>) -> Result<[String : Any]> {
        if !(NetworkReachabilityManager()!.isReachable) {
            return .failure(BackendError.noInternetConnection(reason: "noInternet"))
        }
        
        guard response.result.error == nil else {
            return .failure(response.result.error!)
        }
        
        guard let jsonResponse = response.result.value as? [String : Any] else {
            return .failure(BackendError.objectSerialization(reason: "Could not create object from JSON"))
        }
        
        return .success(jsonResponse)
    }
}
