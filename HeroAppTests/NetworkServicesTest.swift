//
//  NetworkServicesTest.swift
//  HeroAppTests
//
//  Created by Milad Soliman on 29/05/2023.
//

import XCTest
@testable import HeroApp


final class NetworkServicesTest: XCTestCase {

    var networkTest = NetworkService.getInstance()
    
    
    func testGetAllLeaguesShouldFail(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getAllLeagues(sportName: "") { leagues in
            guard let leagues = leagues else{
                APIExprctation.fulfill()
                return
            }
             XCTAssertNil(leagues,"Leagues Is Null")
            APIExprctation.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)
    }
    func testGetAllLeagues(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getAllLeagues(sportName: "football") { leagues in
            guard let leagues = leagues else{
                XCTFail()
                APIExprctation.fulfill()
                return
            }
            XCTAssertGreaterThan(leagues.count, 0, " Leagues Array is Empty")
           
            APIExprctation.fulfill()
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
   
    func testGetUpComingEventsShuldFailDueToSportName(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getUpComingEvents(sportName: "", id: 3) { events in
          guard let events = events else{
              APIExprctation.fulfill()
              return
            }
            XCTAssertEqual(events.count,0, "Upcoming Events Array Is Not Empty")
            APIExprctation.fulfill()

        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    func testGetUpComingEvents(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getUpComingEvents(sportName: "football", id: 3) { events in
          guard let events = events else{
                XCTFail()
              APIExprctation.fulfill()
              return
            }
            XCTAssertGreaterThan(events.count, 0 , "Upcoming Events Array Is Not Empty")
            APIExprctation.fulfill()

        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
 
    
    func testGetLastResultsShouldFail(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getLastResult(sportName: "", id: 3) { events in
          guard let events = events else{
              APIExprctation.fulfill()
              return
            }
            XCTAssertEqual(events.count, 0 , "LastResult Events Array Is Empty")
            APIExprctation.fulfill()

        }
        waitForExpectations(timeout: 30, handler: nil)
        
    }
    
    func testGetLastResults(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getLastResult(sportName: "football", id: 3) { events in
          guard let events = events else{
                XCTFail()
              APIExprctation.fulfill()
              return
            }
            XCTAssertGreaterThan(events.count, 0 , "LastResult Events Array Is Not Empty")
            APIExprctation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testGetTeamsShouldFail(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getTeams(sportName: "", id: 3) { teams in
            guard let teams = teams else {
                APIExprctation.fulfill()
                return
            }
                XCTAssertEqual(teams.count, 0 , "Teams Array Is  Empty")
                APIExprctation.fulfill()

            }
            waitForExpectations(timeout: 50, handler: nil)
        }

    func testGetTeams(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getTeams(sportName: "football", id: 3) { teams in
            guard let teams = teams else {
                XCTFail()
                APIExprctation.fulfill()
                return
            }
                XCTAssertGreaterThan(teams.count, 0 , "Teams Array Is Not Empty")
                APIExprctation.fulfill()

            }
            waitForExpectations(timeout: 30, handler: nil)
        }
    
    
    func testGetTeamDetalisShouldFail(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getTeamDetalis(sportName: "", teamID: 72){ team in
            guard let team = team else {
                APIExprctation.fulfill()
                return
            }
            XCTAssertEqual(team.count, 0 , "Teams Array Is Not Empty")
            APIExprctation.fulfill()

        }
        waitForExpectations(timeout: 30, handler: nil)
    }

   
    
    func testGetTeamDetalis(){
        let APIExprctation = expectation(description: "Wating For Api")
        networkTest.getTeamDetalis(sportName: "football", teamID: 72){ team in
            guard let team = team else {
                XCTFail()
                APIExprctation.fulfill()
                return
            }
            XCTAssertGreaterThan(team.count, 0 , "Teams Array Is Not Empty")
            APIExprctation.fulfill()

        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}



