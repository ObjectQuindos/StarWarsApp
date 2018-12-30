//
//  WebServiceRouter.swift
//  StarWarsApp
//
//  Created by David López on 28/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import Foundation
import Alamofire

enum WebServiceRouter: URLRequestConvertible {
    static let baseURLString = "https://swapi.co/api/"
    
    case getPlanets(String)
    case getPeople(String)
    case getSpaceships(String)
    case getVehicles(String)
    case getSpecies(String)
    case getFilms(String)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getPlanets, .getPeople, .getSpaceships, .getVehicles, .getSpecies, .getFilms:
                return .get
            }
        }
        
        let url: URL = {
            var relativePath: String?
            
            switch self {
            case .getPlanets(let idPlanet):
                relativePath = "planets/\(idPlanet)"
                
            case .getPeople(let idCharacter):
                relativePath = "people/\(idCharacter)"
                
            case .getSpaceships(let idSpaceship):
                relativePath = "starships/\(idSpaceship)"
                
            case .getVehicles(let idVehicle):
                relativePath = "vehicles/\(idVehicle)"
                
            case .getSpecies(let idSpecie):
                relativePath = "species/\(idSpecie)"
                
            case .getFilms(let idFilm):
                relativePath = "films/\(idFilm)"
            }
            
            var url: URL?
            if let relativePath = relativePath {
                let fullStringURL = WebServiceRouter.baseURLString + relativePath
                url = URL(string: fullStringURL)!
            }
            return url!
        }()
        
        let params: ([String : Any]?) = {
            switch self {
            case .getPlanets, .getPeople, .getSpaceships, .getVehicles, .getSpecies, .getFilms:
                return nil
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = JSONEncoding.default
        let urlEncode = try encoding.encode(urlRequest, with: params)
        return urlEncode
    }
}
