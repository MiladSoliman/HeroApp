//
//  League Details.swift
//  HeroApp
//
//  Created by Milad Soliman on 24/05/2023.
//

import Foundation


class LeageDetalisResponse : Decodable{
    var success : Int?
    var result : [EventsData]?
}


class EventsData : Decodable {
    var event_date:String?
    var event_time : String?
    var event_home_team :String?
    var event_away_team : String?
    var home_team_logo :String?
    var away_team_logo:String?
    var event_final_result : String?
    
}
