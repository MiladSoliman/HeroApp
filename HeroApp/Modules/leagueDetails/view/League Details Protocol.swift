//
//  League Details Protocol.swift
//  HeroApp
//
//  Created by Milad Soliman on 24/05/2023.
//

import Foundation
protocol LeagueDetailsProtocol : AnyObject {
    func updateUpComingColl(events : [EventsData])
    func updateResultTable(results:[EventsData])
    func updateTeamsColl(teams:[Team])
}
