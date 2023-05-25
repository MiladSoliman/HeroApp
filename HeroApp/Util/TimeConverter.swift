//
//  TimeConverter.swift
//  HeroApp
//
//  Created by Milad Soliman on 25/05/2023.
//

import Foundation

class TimeConverter {
    
   
    
 static func getCurrentDate() -> String{
     let date = Date()
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: date)
        print(currentDate)
     return currentDate
    }
    
    
   static func getFutureDate() -> String{
        let curentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 30
        
        let futureDate = Calendar.current.date(byAdding: dateComponents, to: curentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let gomingDate = dateFormatter.string(from: futureDate!)
        print(gomingDate)
       return gomingDate
    }
    
    
    static func getPastDate() -> String {
        let calendar = Calendar.current
        let today = Date()
        let pastDate = calendar.date(byAdding: .day, value: -365, to: today)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let lastDate = dateFormatter.string(from: pastDate!)
        print(lastDate)
        return lastDate
    }
    
    
}

