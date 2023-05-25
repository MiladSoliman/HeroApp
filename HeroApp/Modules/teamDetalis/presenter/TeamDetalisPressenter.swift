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
    
    
    func setData(name:String,id:Int){
        self.sportName = name
        self.teamId = id
        
    }
    
    func attachView(view : TeamDetalsProtocle!){
        self.teamView = view
    }

    
    func getTeamDetails(){
        networkServices.getTeamDetalis(sportName: sportName ?? "football", teamID: teamId ?? 97) { [weak self] team in
            self?.teamView.UpdatePage(teams: team ?? [])

        }
    }
    
    
    
    
    
}
