//
//  CehckNetworkConniction.swift
//  HeroApp
//
//  Created by Milad Soliman on 30/05/2023.
//

import Foundation
import Reachability
class NetworkConnection {
    
  static func checkConnection() -> Bool {
        let reachability = try?Reachability()
      if (reachability?.connection == Reachability.Connection.unavailable) {
            return false
        }else{
            return true
        }
 
    }
    
    
    
    
}
