//
//  NetworkServices.swift
//  HeroApp
//
//  Created by Milad Soliman on 23/05/2023.
//

import Foundation
import Alamofire
class NetworkService : NetworkServiceProtocol {
    private static var sharedInstance = NetworkService()
  
     static func getInstance() -> NetworkService {
         return sharedInstance
     }
    private init(){
        
    }
    //7a3ff532ffb7c601002e854e557585a639777541cad290903bfe2649689476ba
    //e97553b267bdf2f497c7cbefa750f788bda7aa5d4d2027cd095a93dda4bf5806


    var firstPart = "https://apiv2.allsportsapi.com/"
    var secondPart = "APIkey=7a3ff532ffb7c601002e854e557585a639777541cad290903bfe2649689476ba"
    let from = TimeConverter.getCurrentDate()
    let to =  TimeConverter.getFutureDate()
    let past = TimeConverter.getPastDate()

    func getAllLeagues(sportName:String,complition: @escaping ([League]?) -> Void ){
        let url = URL(string:firstPart+sportName+"/?met=Leagues&"+secondPart)
        let request = URLRequest(url: url!)
        let seassion = URLSession(configuration: .default)
        let task = seassion.dataTask(with: request) { ( data,response,error ) in
            guard let data = data else {return}
            let decoder = JSONDecoder()
            do{
                let decodedData =  try decoder.decode(ApiResponse.self, from: data)
                complition(decodedData.result)
            }catch{
                complition(nil)
            }
        }
        task.resume()
    }
    func getUpComingEvents(sportName:String,id:Int,complition: @escaping ([EventsData]?) -> Void){
        let url = firstPart+sportName+"/?met=Fixtures&"+secondPart+"&from="+from+"&to="+to+"&leagueId="+String(id)
        AF.request(url).response { response in
            guard let data = response.data else {return}
            do{
                let decodedData = try JSONDecoder().decode(LeageDetalisResponse.self, from: data)
                complition(decodedData.result)
            }catch{
                complition([])
            }
        }
    }
    
    
    func getLastResult(sportName:String,id:Int,complition: @escaping ([EventsData]?)->Void){
        let url = firstPart+sportName+"/?met=Fixtures&"+secondPart+"&from="+past+"&to="+from+"&leagueId="+String(id)
        AF.request(url).response {response in
            guard let data = response.data else {return}
            do{
                let decodedData = try JSONDecoder().decode(LeageDetalisResponse.self, from: data)
                complition(decodedData.result)
            }catch{
                complition([])
               
            }
        }
    }
    
    
   func getTeams(sportName:String,id:Int , complition: @escaping ([Team]?)->Void){
       let url = firstPart+sportName+"/?&met=Teams&"+secondPart+"&leagueId="+String(id)
           
       AF.request(url).response { response in
            
            guard let data = response.data else {return}
            do{
                let decodedData = try JSONDecoder().decode(TeamDetails.self, from: data)
                complition(decodedData.result)
            }catch{
                complition([])
            }
        }
        
    }
    
    
    func getTeamDetalis(sportName:String,teamID:Int,complition: @escaping ([Team]?)->Void){
        let url = firstPart+sportName + "/?&met=Teams&" + secondPart + "&teamId=" + String(teamID)
        AF.request(url).response { response in
             guard let data = response.data else {return}
             do{
                 let decodedData = try JSONDecoder().decode(TeamDetails.self, from: data)
                 complition(decodedData.result)
             }catch{
                 complition([])
             }
         }
         
     }
        

    
    
    

}





