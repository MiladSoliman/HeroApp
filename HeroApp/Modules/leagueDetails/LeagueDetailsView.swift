//
//  LeagueDetailsView.swift
//  HeroApp
//
//  Created by Milad Soliman on 25/05/2023.
//

import Foundation

class LeagueDetalisView {
    
    var teamHomeName : String
    var teamAwayName : String
    var teamHomeImg : String
    var teamAwatImg : String
    var time : String
    var date : String
    var result : String
    
    init(name1:String,name2:String,img1:String,img2:String,time:String,date:String,result:String){
        teamHomeName = name1
        teamAwayName = name2
        teamHomeImg = img1
        teamAwatImg = img2
        self.time = time
        self.date = date
        self.result = result
    }
}
