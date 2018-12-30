//
//  TypeRequests.swift
//  StarWarsApp
//
//  Created by David López on 28/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import Foundation

enum TypeSelected: String {
    case planets = "planets"
    case people = "people"
    case spaceships = "spaceships"
    case vehicles = "vehicles"
    case species = "species"
}

class TypeRequests {
    
    let globalQueue = DispatchQueue.global(qos: .userInitiated)
    private static let allDataDownloadGroup = DispatchGroup()
    static var allStarWarsData: [String : Any] = [:]
    
    static func getAllStarWarsData(completionHandler: @escaping ([String : Any]) -> Void) {
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getPlanets()
        
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getPeople()
        
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getSpaceships()
        
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getVehicles()
        
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getSpecies()
        
        TypeRequests.allDataDownloadGroup.enter()
        TypeRequests.getFilms()
        
        TypeRequests.allDataDownloadGroup.notify(queue: DispatchQueue.main) {
            completionHandler(allStarWarsData)
        }
    }
    
    static func getPlanets() {
        let planetsDownloadGroup = DispatchGroup()
        var planetsArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 50) { (index) in
            planetsDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getPlanets(idPlanet: index, completionHandler: { (response) in
                response?.ifSuccess {
                    planetsArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                planetsDownloadGroup.leave()
            })
        }
        
        planetsDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["planets"] = planetsArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
    
    static func getPeople() {
        let peopleDownloadGroup = DispatchGroup()
        var peopleArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 50) { (index) in
            peopleDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getPeople(idCharacter: index, completionHandler: { (response) in
                response?.ifSuccess {
                    peopleArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                peopleDownloadGroup.leave()
            })
        }
        
        peopleDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["people"] = peopleArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
    
    static func getSpaceships() {
        let spaceshipsDownloadGroup = DispatchGroup()
        var spaceshipsArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 50) { (index) in
            spaceshipsDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getSpaceships(idSpaceship: index, completionHandler: { (response) in
                response?.ifSuccess {
                    spaceshipsArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                spaceshipsDownloadGroup.leave()
            })
        }
        
        spaceshipsDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["spaceships"] = spaceshipsArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
    
    static func getVehicles() {
        let vehiclesDownloadGroup = DispatchGroup()
        var vehiclesArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 50) { (index) in
            vehiclesDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getVehicles(idVehicle: index, completionHandler: { (response) in
                response?.ifSuccess {
                    vehiclesArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                vehiclesDownloadGroup.leave()
            })
        }
        
        vehiclesDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["vehicles"] = vehiclesArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
    
    static func getSpecies() {
        let speciesDownloadGroup = DispatchGroup()
        var speciesArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 50) { (index) in
            speciesDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getSpecies(idSpecie: index, completionHandler: { (response) in
                response?.ifSuccess {
                    speciesArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                speciesDownloadGroup.leave()
            })
        }
        
        speciesDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["species"] = speciesArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
    
    static func getFilms() {
        let filmsDownloadGroup = DispatchGroup()
        var filmsArray: [[String : Any]] = []
        
        DispatchQueue.concurrentPerform(iterations: 8) { (index) in
            filmsDownloadGroup.enter()
            
            WebServiceManager.sharedInstance.getFilms(idFilm: index, completionHandler: { (response) in
                response?.ifSuccess {
                    filmsArray.append(response!.value!)
                }
                response?.ifFailure {
                    print("Error: \(String(describing: response!.error))")
                }
                filmsDownloadGroup.leave()
            })
        }
        
        filmsDownloadGroup.notify(queue: DispatchQueue.main) {
            TypeRequests.allStarWarsData["films"] = filmsArray
            TypeRequests.allDataDownloadGroup.leave()
        }
    }
}
