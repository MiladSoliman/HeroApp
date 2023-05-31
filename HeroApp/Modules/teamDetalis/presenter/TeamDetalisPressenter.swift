//
//  TeamDetalisPressenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 25/05/2023.
//

import Foundation


class TeamDeatlsPressenter {
    
    weak var teamView : TeamDetalsProtocle!
    var networkServices = NetworkService.getInstance()
    var sportName:String?
    var teamId : Int?
    var teamName:String?
    var cashingData = TeamsDataBase.getInstance()
    
    
    func setData(name:String,id:Int,teamName:String){
        self.sportName = name
        self.teamId = id
        self.teamName = teamName
        
    }
    
    func attachView(view : TeamDetalsProtocle!){
        self.teamView = view
    }

    
    func getTeamDetails(){
        networkServices.getTeamDetalis(sportName: sportName ?? "football", teamID: teamId ?? 97) { [weak self] team in
            self?.teamView.UpdatePage(teams: team ?? [])

        }
    }
    
    func saveToFavourite(teamName: String, imag: Data, id: Int){
        cashingData.saveTeam(teamName: teamName, imag: imag, id: id)
    }
    
    func isTeamInFav() -> Bool{
      return cashingData.isFavTeam(teamName: self.teamName ?? "Barcelona")
    }
    
    
    
    
    
    
}
