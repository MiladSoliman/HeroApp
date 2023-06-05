//
//  HomePressenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 30/05/2023.
//

import Foundation

class HomePressenter {
   

    func getNetworkState() -> Bool{
        if ( NetworkConnection.checkConnection() ){
            return true
        }else{
            return false
        }
    }
    
    
}
