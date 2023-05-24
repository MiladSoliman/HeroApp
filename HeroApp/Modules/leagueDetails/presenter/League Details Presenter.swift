//
//  League Details Presenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 24/05/2023.
//

import Foundation

class LeagueDetalisPressenter {
    var leagueID :Int?
    var sportName:String?
    var networkService = NetworkService.getInstance()
    weak var view : LeagueDetailsProtocol!
   
    
    func setData(id:Int,name:String){
        self.leagueID = id
        self.sportName = name
        print(leagueID! , sportName!)
    }
    
    func attachView(view : LeagueDetailsProtocol){
        self.view = view
    }
    
   func getUpComingEvents(){
        print("Hello From UpComing Method")
        print(leagueID , sportName)
        networkService.getUpComingEvents { [weak self] upcomings in
            self?.view.updateUpComingColl(events: upcomings!)
        }
    }
    
    func getLastResults(){
        networkService.getLastResult { [weak self] lastresult in
           self?.view.updateResultTable(results: lastresult!)
            
        }
    }
    
 func getTeams(){
        networkService.getTeams { teams in
        //  self?.view.updateTeamsColl(teams: teams!)
            print("Data in detalis presenter")
            
        }
    }
    
}
