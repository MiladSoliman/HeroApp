//
//  MokeNetworkServices.swift
//  HeroAppTests
//
//  Created by Milad Soliman on 29/05/2023.
//

import Foundation
@testable import HeroApp
class MokeNetworkServices : NetworkServiceProtocol {
    
    var isErorr : Bool
    
    init(isErorr: Bool) {
        self.isErorr = isErorr
    }
    

    func getAllLeagues(sportName: String, complition: @escaping ([HeroApp.League]?) -> Void) {
        if isErorr {
            complition(nil)
        }
        else {
            let mokeData = MokeJsonResponse.mokeAllLeagues.data(using: .utf8)!
            do{
                let data = try JSONDecoder().decode(ApiResponse.self, from: mokeData)
                complition(data.result)
            }catch{
                complition(nil)
            }
        }
    }
    
    
    
    
    
    func getUpComingEvents(sportName: String, id: Int, complition: @escaping ([HeroApp.EventsData]?) -> Void) {
        if isErorr {
            complition(nil)
        }
        else {
            let mokeData = MokeJsonResponse.mokeUpcomingEvents.data(using: .utf8)!
            do{
                let data = try JSONDecoder().decode(LeageDetalisResponse.self, from: mokeData)
                complition(data.result)
            }catch{
                complition(nil)
            }
        }
        
    }
    
    
    
    
    func getLastResult(sportName: String, id: Int, complition: @escaping ([HeroApp.EventsData]?) -> Void) {
        if isErorr {
            complition(nil)
        }
        else {
            let mokeData = MokeJsonResponse.mokeLatestResult.data(using: .utf8)!
            do{
                let data = try JSONDecoder().decode(LeageDetalisResponse.self, from: mokeData)
                complition(data.result)
            }catch{
                complition(nil)
            }
        }
        
    }
    
    
    
    
    
    func getTeams(sportName: String, id: Int, complition: @escaping ([HeroApp.Team]?) -> Void) {
        if isErorr {
            complition(nil)
        }
        else {
            let mokeData = MokeJsonResponse.mokeTeamsForLeagues.data(using: .utf8)!
            do{
                let data = try JSONDecoder().decode(TeamDetails.self, from: mokeData)
                complition(data.result)
            }catch{
                complition(nil)
            }
        }
        
    }
    
    
    
    
    
    func getTeamDetalis(sportName: String, teamID: Int, complition: @escaping ([HeroApp.Team]?) -> Void) {
        if isErorr {
            complition(nil)
        }
        else {
            let mokeData = MokeJsonResponse.mokeTeamDetalis.data(using: .utf8)!
            do{
                let data = try JSONDecoder().decode(TeamDetails.self, from: mokeData)
                complition(data.result)
            }catch{
                complition(nil)
            }
        }
        
    }
    
    
}
