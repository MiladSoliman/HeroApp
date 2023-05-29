//
//  NetworkServicesProtocol.swift
//  HeroApp
//
//  Created by Milad Soliman on 29/05/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getAllLeagues(sportName:String,complition: @escaping ([League]?) -> Void )
   func getUpComingEvents(sportName:String,id:Int,complition: @escaping ([EventsData]?) -> Void)
 
    func getLastResult(sportName:String,id:Int,complition: @escaping ([EventsData]?)->Void)
    
    func getTeams(sportName:String,id:Int , complition: @escaping ([Team]?)->Void)
    
    func getTeamDetalis(sportName:String,teamID:Int,complition: @escaping ([Team]?)->Void)
}
