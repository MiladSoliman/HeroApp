//
//  FavoritePressenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 28/05/2023.
//

import Foundation

class FavoritePressenter {
    
    var cashingData = TeamsDataBase.getInstance()
    weak var favView : FavoriteProtocol!
   
    var teamName:String?
    
    func attachView(view : FavoriteProtocol){
        self.favView = view
    }
    
    
    
    func getFavTeams() {
      let favoriteTeams = cashingData.retriveSavedTeams()
        favView.updateTable(favTeams: favoriteTeams)
    }
    
    func deletTeamFromFav(removedTeamName : String){
        cashingData.deletTeam(teamName: removedTeamName)
    }
    
    func navigateToDetalisScreen(sportName:String , teamId:Int) -> TeamDeatlsPressenter {
        let teamDetalisP = TeamDeatlsPressenter()
        teamDetalisP.setData(name: sportName, id: teamId , teamName: self.teamName!)
        return teamDetalisP
    }
    
    
    func getNetworkState() -> Bool{
        if ( NetworkConnection.checkConnection() ){
            return true
        }else{
            return false
        }
    }
    
  
    
    
}
