//
//  Team.swift
//  HeroApp
//
//  Created by Milad Soliman on 24/05/2023.
//

import Foundation


struct TeamDetails: Decodable {
    let success: Int?
    let result: [Team]?
}

struct Team :Decodable {
    let team_key:Int?
    let team_name:String?
    let team_logo:String?
    let players:[Player]?
    let coaches:[Coach]?
    

}
struct Player:Decodable {
    let player_age:String?
    let player_image:String?
    let player_name:String?
    let player_number:String?
    let player_type:String?
}
struct Coach:Decodable{
    let coach_name:String?
}
