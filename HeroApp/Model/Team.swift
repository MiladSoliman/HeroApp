//
//  Team.swift
//  HeroApp
//
//  Created by Milad Soliman on 24/05/2023.
//

import Foundation

class TeamResponse : Decodable{
    var success:Int?
    var result:[Team]?
}

class Team : Decodable {
    var team_logo : String?
    var team_name :String?
    var players : [Player]?
    var coaches : [Coach]?
}

class Player : Decodable {
    var player_name:String?
    var player_number:Int?
    var player_type:String?
    var player_image:String?
}

class Coach : Decodable{
    var coach_name:String?
    
}
