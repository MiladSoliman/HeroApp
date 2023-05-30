//
//  HomePressenter.swift
//  HeroApp
//
//  Created by Milad Soliman on 30/05/2023.
//

import Foundation

class HomePressenter {
    var isOnline : Bool!
    
    
    
    func getNetworkState() {
        if ( NetworkConnection.checkConnection() ){
            isOnline = true
        }else{
            isOnline = false
        }
    }
    
    
}
