//
//  FavoriteTeamView.swift
//  HeroApp
//
//  Created by Milad Soliman on 28/05/2023.
//

import Foundation



class MySavedTeam {
    var savedTeamName : String
    var savedTeamImg : Data
    var savedTeamId : Int
    
    init(savedTeamName: String, savedTeamImg: Data, savedTeamId: Int) {
        self.savedTeamName = savedTeamName
        self.savedTeamImg = savedTeamImg
        self.savedTeamId = savedTeamId
    }
    
}
