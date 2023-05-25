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
    // time
    var event_time : String?

    //Date
    var event_date:String?
    //cricketDate
    var event_date_stop : String?
    
  // names
    var event_home_team :String?
    var event_away_team : String?
    
  // names Tennis
    var event_first_player :String?
    var event_second_player :String?
    
    
    
  // FootBall logo
    var home_team_logo :String?
    var away_team_logo:String?
    
    
  //Basket & Cricket Logo
    var event_home_team_logo : String?
    var event_away_team_logo : String?
    
  // tennis Logo
    var event_first_player_logo :String?
    var event_second_player_logo :String?
    
    
    
   //result
    var event_final_result : String?
    
  //cricket Result
    var event_home_final_result :String?
    var even_away_final_result :String?
    
}
