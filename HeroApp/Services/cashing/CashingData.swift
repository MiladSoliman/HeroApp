//
//  CashingData.swift
//  HeroApp
//
//  Created by Milad Soliman on 28/05/2023.
//

import Foundation
import CoreData
import UIKit

class TeamsDataBase {
    

    
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private static var sharedCash = TeamsDataBase()
    static func getInstance() -> TeamsDataBase {
        return sharedCash
    }
    private init(){
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
    }
    
    
    func saveTeam(teamName:String , imag : Data , id : Int){
        let entity = NSEntityDescription.entity(forEntityName: "SavedTeam", in: context)
        let savedTeam = NSManagedObject(entity: entity!, insertInto: context)
        
        savedTeam.setValue(teamName, forKey: "name")
        savedTeam.setValue(imag, forKey: "imag")
        savedTeam.setValue(id, forKey: "id")
        do{
            try context.save()
            print("Saved Susccessfuly")
        } catch{
            print("Error")
        }
    }
    
    
    func retriveSavedTeams() -> [MySavedTeam] {
        var mySavedTeams : [MySavedTeam] = []
       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SavedTeam")
       do{
           let savedTeams = try context.fetch(fetchRequest)
           for i in 0..<savedTeams.count{
               let teamName = savedTeams[i].value(forKey: "name") as! String
               let teamId = savedTeams[i].value(forKey: "id") as! Int
               let teamImg = savedTeams[i].value(forKey: "imag") as! Data
               
             let team = MySavedTeam(savedTeamName: teamName, savedTeamImg: teamImg, savedTeamId: teamId)
               mySavedTeams.append(team)
               print(savedTeams[i].value(forKey: "name") ?? "Mazmizo")
               
           }
       }catch{
           print("Erorr")
       }
 
     return mySavedTeams
    }
    
    
    
    func deletTeam(teamName:String){
       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SavedTeam")
       let predict = NSPredicate(format: "name=%@", teamName)
       fetchRequest.predicate = predict
       do{
           let teams = try context.fetch(fetchRequest)
           for i in 0..<teams.count{
               context.delete(teams[i])
              try context.save()
           }
       }catch{
           print("Erorr")
       }
        
    }
    
    
    func isFavTeam(teamName:String) -> Bool{
        var isFav : Bool = false
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SavedTeam")
        let predict = NSPredicate(format: "name=%@", teamName)
        fetchRequest.predicate = predict
        do{
            let favTeams = try context.fetch(fetchRequest)
            if(favTeams.count != 0){
            
                isFav = true
            }else {
                isFav = false
            }
        }catch{
            print("Erorr")
        }
         return isFav
     }
    
}

    
    
    
    
    
    
    



