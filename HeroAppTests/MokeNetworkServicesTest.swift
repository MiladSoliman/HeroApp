//
//  MokeNetworkServicesTest.swift
//  HeroAppTests
//
//  Created by Milad Soliman on 29/05/2023.
//

import XCTest
@testable import HeroApp
final class MokeNetworkServicesTest: XCTestCase {

    var mokeNetworkTest : NetworkServiceProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testGetAllLeaguesShoudPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: true)
        mokeNetworkTest.getAllLeagues(sportName: "") { leagues in
            XCTAssertNil(leagues,"Leagues Is Not Nil")
        }
    }
    
    func testGetAllLeaguesShouldPassDueToParsing(){
        mokeNetworkTest = MokeNetworkServices(isErorr: false)
        mokeNetworkTest.getAllLeagues(sportName: "") { leagues in
            XCTAssertGreaterThan(leagues!.count, 0 , "Leagues Is Not Empty")
        }
    }
    
    func testGetUpconigEventsWithNoErrorShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: true)
        mokeNetworkTest.getUpComingEvents(sportName: "", id: 0) { upcomings in
            XCTAssertNil(upcomings,"Leagues Is Not Nil")
            
        }
    }
    
    func testGetUpComingWithCorrectPasringShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: false)
        mokeNetworkTest.getUpComingEvents(sportName: "", id: 0) { upcomings in
            XCTAssertGreaterThan(upcomings!.count, 0 , "Leagues Is Not Empty")
            
        }
        
    }
    
    
    func testGetLatestResultWithErrorShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: true)
        mokeNetworkTest.getLastResult(sportName: "", id: 0) { lastResults in
            XCTAssertNil(lastResults,"Leagues Is Not Nil")
            
        }
    }
    
    
    func testGetLatestResultWithCorrectParsingShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: false)
        mokeNetworkTest.getLastResult(sportName: "", id: 0) { lastResults in
            XCTAssertGreaterThan(lastResults!.count, 0 , "Leagues Is Not Empty")
            
        }
    }
    
    
    func testGetTeamsWithErorrShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: true)
        mokeNetworkTest.getTeams(sportName: "", id: 0) { teams in
            XCTAssertNil(teams,"Leagues Is Not Nil")
            
        }
        
    }
    
    func testGetTeamsWithCorrectParsingShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: false)
        mokeNetworkTest.getTeams(sportName: "", id: 0) { teams in
            XCTAssertGreaterThan(teams!.count, 0 , "Leagues Is Not Empty")
            
        }
        
    }
    
    
    func testGetTeamDetalisWithErrorShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: true)
        mokeNetworkTest.getTeamDetalis(sportName: "", teamID: 0) { team in
            XCTAssertNil(team,"Leagues Is Not Nil")
            
        }
        
    }
    
    func testGetTeamDetailsWithCorrectParsingShouldPass(){
        mokeNetworkTest = MokeNetworkServices(isErorr: false)
        mokeNetworkTest.getTeamDetalis(sportName: "", teamID: 0) { team in
            XCTAssertGreaterThan(team!.count, 0 , "Leagues Is Not Empty")
            
        }
        
    }
    
    
    
    
    
    
    


}
