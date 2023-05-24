//
//  LeaguePresenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 23/05/2023.
//

import Foundation

class LeaguePresenter {
    weak var leagueView : LeaguesProtocol!
    var network = NetworkService.getInstance()
  //  var leagueDetalisPressenter = LeagueDetalisPressenter()
    var sportName : String?
    var myLeagues : [League]!
    var leagueId : Int?
    
    
    func attatchView (view : LeaguesProtocol){
        self.leagueView = view
    }
    
    
    func getAllLeagues(){
        self.network.getAllLeagues(sportName: self.sportName ?? "football", complition: { [weak self] leagues in
          print("Data Recived")
            self?.myLeagues = leagues
            self?.leagueView.updateTable(leagues: leagues!)
        })
       
        }
    
    func getPressentr() -> LeagueDetalisPressenter {
        var leageDetalisPressenter = LeagueDetalisPressenter()
        leageDetalisPressenter.setData(id: leagueId!, name: sportName!)
        return leageDetalisPressenter
    }
        
        
        
        

                                  
                                
        
    
 
    
}
    
    

