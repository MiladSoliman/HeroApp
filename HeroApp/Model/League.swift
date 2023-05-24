//
//  League.swift
//  HeroApp
//
//  Created by Milad Soliman on 23/05/2023.
//

import Foundation

class ApiResponse : Decodable {
    var success : Int
    var result : [League]
    
}


class League : Decodable {
    var league_key : Int?
    var league_name : String?
    var league_logo : String?
}
