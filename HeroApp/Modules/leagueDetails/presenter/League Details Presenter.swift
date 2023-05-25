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
    var teamId :Int?
    var networkService = NetworkService.getInstance()
    weak var view : LeagueDetailsProtocol!
  //  var temp : [LeagueDetalisView] = []
    
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
        print(leagueID! , sportName!)
       networkService.getUpComingEvents(sportName: sportName ?? "football" , id: leagueID ?? 3) { [weak self] upcomings in
         //  self?.view.updateUpComingColl(events: upcomings ?? [])
           self?.setLeagueDetailsView(data: upcomings ?? [])
       //    self?.view.updateUpComingColl(events: self!.temp)
           
       }
    }
    
    func getLastResults(){
        networkService.getLastResult (sportName: sportName ?? "football" , id: leagueID ?? 3) { [weak self] lastresult in
            self?.setLeaguesResultView(result: lastresult ?? [])
      //    self?.view.updateResultTable(results: temp)
            
        }
    }
    
 func getTeams(){
        networkService.getTeams(sportName: sportName ?? "football" , id: leagueID ?? 3){ [weak self] teams in
         self?.view.updateTeamsColl(teams: teams ?? [])
            print("Data in detalis presenter")
        }
    }
    
  
    
    
    
    func setTeamDetailsData () -> TeamDeatlsPressenter {
        let teamPressenter = TeamDeatlsPressenter()
        teamPressenter.setData(name: sportName!, id: teamId!)
        return teamPressenter
    }
    
    
    func setLeagueDetailsView(data:[EventsData]){
        switch (sportName){
          case "football" :
            var temp : [LeagueDetalisView] = []
            data.forEach { data in
                let time = data.event_time
                let date = data.event_date
                let teamOneName = data.event_home_team
                let teamTwoName = data.event_away_team
                let teamOneImg = data.home_team_logo
                let teamTwoImg = data.away_team_logo
                let result = data.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName!, name2: teamTwoName!, img1: teamOneImg!, img2: teamTwoImg!, time: time!, date: date!, result: result!)
                
                temp.append(leagueView)
            }
            self.view.updateUpComingColl(events: temp)
        
        case "basketball" :
            var temp : [LeagueDetalisView] = []
            data.forEach { data in
                let time = data.event_time
                let date = data.event_date
                let teamOneName = data.event_home_team
                let teamTwoName = data.event_away_team
                let teamOneImg = data.event_home_team_logo
                let teamTwoImg = data.event_away_team_logo
                let result = data.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName!, name2: teamTwoName!, img1: teamOneImg!, img2: teamTwoImg!, time: time!, date: date!, result: result!)
                
                temp.append(leagueView)
            }
            self.view.updateUpComingColl(events: temp)
            
        case "cricket" :
            var temp : [LeagueDetalisView] = []
            data.forEach { data in
                let time = data.event_time
                let date = data.event_date_stop
                let teamOneName = data.event_home_team
                let teamTwoName = data.event_away_team
                let teamOneImg = data.event_home_team_logo
                let teamTwoImg = data.event_away_team_logo
                let result = data.event_home_final_result! + data.even_away_final_result!
                
                let leagueView = LeagueDetalisView(name1: teamOneName ?? "" , name2: teamTwoName ?? "" , img1: teamOneImg ?? "" , img2: teamTwoImg ?? "", time: time ?? "", date: date ?? "", result: result )
                
                temp.append(leagueView)
            }
            self.view.updateUpComingColl(events: temp)
            
        case "tennis":
            var temp : [LeagueDetalisView] = []
            data.forEach { data in
                let time = data.event_time
                let date = data.event_date
                let teamOneName = data.event_first_player
                let teamTwoName = data.event_second_player
                let teamOneImg = data.event_first_player_logo
                let teamTwoImg = data.event_second_player_logo
                let result = data.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName ?? "" , name2: teamTwoName ?? "", img1: teamOneImg ?? "", img2: teamTwoImg ?? "", time: time ?? "", date: date ?? "", result: result ?? "")
                
                temp.append(leagueView)
            }
            self.view.updateUpComingColl(events: temp)
 
        default :
            print("Defult")
            
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    func setLeaguesResultView(result:[EventsData]){
        switch (sportName) {
        case "football":
            var temp : [LeagueDetalisView] = []
            result.forEach { result in
                
                let time = result.event_time
                let date = result.event_date
                let teamOneName = result.event_home_team
                let teamTwoName = result.event_away_team
                let teamOneImg = result.home_team_logo
                let teamTwoImg = result.away_team_logo
                let result = result.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName!, name2: teamTwoName!, img1: teamOneImg!, img2: teamTwoImg!, time: time!, date: date!, result: result!)
                
                temp.append(leagueView)
            }
            
            self.view.updateResultTable(results: temp)
            
            
        case "basketball" :
            var temp : [LeagueDetalisView] = []
            result.forEach { result in
                let time = result.event_time
                let date = result.event_date
                let teamOneName = result.event_home_team
                let teamTwoName = result.event_away_team
                let teamOneImg = result.event_home_team_logo
                let teamTwoImg = result.event_away_team_logo
                let result = result.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName ?? "" , name2: teamTwoName ?? "", img1: teamOneImg ?? "" , img2: teamTwoImg ?? "", time: time ?? "" , date: date ?? "", result: result ?? "")
                
                temp.append(leagueView)
            }
            self.view.updateResultTable(results:temp)
            
        case "cricket" :
            var temp : [LeagueDetalisView] = []
            result.forEach { result in
                let time = result.event_time
                let date = result.event_date_stop
                let teamOneName = result.event_home_team
                let teamTwoName = result.event_away_team
                let teamOneImg = result.event_home_team_logo
                let teamTwoImg = result.event_away_team_logo
                let result = result.event_home_final_result! + result.even_away_final_result!
                
                let leagueView = LeagueDetalisView(name1: teamOneName ?? "" , name2: teamTwoName ?? "" , img1: teamOneImg ?? "" , img2: teamTwoImg ?? "", time: time ?? "", date: date ?? "", result: result )
                
                temp.append(leagueView)
            }
            self.view.updateResultTable(results:temp)
            
        case "tennis":
            var temp : [LeagueDetalisView] = []
            result.forEach { result in
                let time = result.event_time
                let date = result.event_date
                let teamOneName = result.event_first_player
                let teamTwoName = result.event_second_player
                let teamOneImg = result.event_first_player_logo
                let teamTwoImg = result.event_second_player_logo
                let result = result.event_final_result
                
                let leagueView = LeagueDetalisView(name1: teamOneName ?? "" , name2: teamTwoName ?? "", img1: teamOneImg ?? "", img2: teamTwoImg ?? "", time: time ?? "", date: date ?? "", result: result ?? "")
                
                temp.append(leagueView)
            }
            self.view.updateResultTable(results:temp)
            
            
        default :
            print("Default")
            
        }
    }
    
    
}
