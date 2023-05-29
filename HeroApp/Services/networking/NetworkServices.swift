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
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let decodedData =  try decoder.decode(ApiResponse.self, from: data)
             
                complition(decodedData.result)
                
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getUpComingEvents(sportName:String,id:Int,complition: @escaping ([EventsData]?) -> Void){
    
      
        
        let url = firstPart+sportName+"/?met=Fixtures&"+secondPart+"&from="+from+"&to="+to+"&leagueId="+String(id)
     
     //   AF.request("https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2023-5-23&to=2023-06-10&leagueId=3")
            
        AF.request(url).response { response in
            
            guard let data = response.data else {return}
            do{
                let decodedData = try JSONDecoder().decode(LeageDetalisResponse.self, from: data)
                print("UPComing is recived")
        
                complition(decodedData.result)
            }catch{
                complition([])
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getLastResult(sportName:String,id:Int,complition: @escaping ([EventsData]?)->Void){
        
     
    
        
        let url = firstPart+sportName+"/?met=Fixtures&"+secondPart+"&from="+past+"&to="+from+"&leagueId="+String(id)
        
       // AF.request("https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2023-5-13&to=2023-05-23&leagueId=3")
            
        AF.request(url).response {response in
            
            guard let data = response.data else {return}
            do{
                let decodedData = try JSONDecoder().decode(LeageDetalisResponse.self, from: data)
                complition(decodedData.result)
            }catch{
                complition([])
                print(error.localizedDescription)
            }
        }
    }
    
    
   func getTeams(sportName:String,id:Int , complition: @escaping ([Team]?)->Void){
       let url = firstPart+sportName+"/?&met=Teams&"+secondPart+"&leagueId="+String(id)
       
     /*   AF.request("https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=7a3ff532ffb7c601002e854e557585a639777541cad290903bfe2649689476ba&leagueId=3") */
           
       AF.request(url).response { response in
            
            guard let data = response.data else {return}
            print(data)
            do{
                let decodedData = try JSONDecoder().decode(TeamDetails.self, from: data)
                complition(decodedData.result)
           
            }catch{
                complition([])
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func getTeamDetalis(sportName:String,teamID:Int,complition: @escaping ([Team]?)->Void){
        
        let url = firstPart+sportName + "/?&met=Teams&" + secondPart + "&teamId=" + String(teamID)
        

      //  AF.request("https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=7a3ff532ffb7c601002e854e557585a639777541cad290903bfe2649689476ba&teamId=72")
            
            
        AF.request(url).response { response in
             
             guard let data = response.data else {return}
             print(data)
             do{
                 let decodedData = try JSONDecoder().decode(TeamDetails.self, from: data)
                 complition(decodedData.result)
             }catch{
                 complition([])
                 print(error.localizedDescription)
             }
         }
         
     }
        

    
    
    

}





