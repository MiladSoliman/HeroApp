//
//  LeagueDetailsViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 22/05/2023.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate, UITableViewDataSource, LeagueDetailsProtocol {

    var presenter : LeagueDetalisPressenter!
    @IBOutlet weak var teamColliction: UICollectionView!
    @IBOutlet weak var resultTable: UITableView!
    @IBOutlet weak var upcomingColliction: UICollectionView!
    var events : [EventsData] = []
    var results : [EventsData] = []
    var teams : [Team] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingColliction.dataSource = self
        upcomingColliction.delegate = self
        resultTable.delegate = self
        resultTable.dataSource = self
        teamColliction.dataSource = self
        teamColliction.delegate = self
    //    presenter = LeagueDetalisPressenter()
        presenter.attachView(view: self)
        presenter.getUpComingEvents()
        presenter.getLastResults()
        presenter.getTeams()
        
    }
    func updateUpComingColl(events: [EventsData]) {
        self.events = events
        DispatchQueue.main.async {
            self.upcomingColliction.reloadData()
        }
        print(events[0].event_away_team!) // real madrid
    }
    
    func updateResultTable(results: [EventsData]) {
        self.results = results
        DispatchQueue.main.async {
            self.resultTable.reloadData()
        }
        print(results[0].event_final_result!) // 4-0
    }
    
    func updateTeamsColl(teams: [Team]) {
        self.teams = teams
        DispatchQueue.main.async {
            self.teamColliction.reloadData()
        }
        print(teams[0].team_name!) // Byern
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingColliction {
            return events.count
        }else {
            return teams.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingColliction {
            
            let upComingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCell
            upComingCell.teamOneImgV.sd_setImage(with: URL(string: events[indexPath.row].home_team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        //  upComingCell.teamOneImgV.layer.cornerRadius = upComingCell.teamOneImgV.frame.size.height / 5
            upComingCell.teamOneName.text = events[indexPath.row].event_home_team
            upComingCell.teamTowImgV.sd_setImage(with: URL(string: events[indexPath.row].away_team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
         //   upComingCell.teamTowImgV.layer.cornerRadius = upComingCell.teamTowImgV.frame.size.height / 5
            upComingCell.teamTwoName.text = events[indexPath.row].event_away_team
            upComingCell.eventDate.text = events[indexPath.row].event_date
            upComingCell.eventTime.text = events[indexPath.row].event_time
            upComingCell.upcmoingCellView.layer.cornerRadius = upComingCell.frame.size.height / 5
            //  upComingCell.layer.masksToBounds = true
            
            return upComingCell
        }else {
            
            let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamColCell", for: indexPath) as! TeamCollectionViewCell
            teamCell.teamImageView.sd_setImage(with: URL(string: teams[indexPath.row].team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
            teamCell.teamCellView.layer.cornerRadius = teamCell.frame.size.height / 5
            return teamCell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamColliction {
            
            let detalisSc = storyboard?.instantiateViewController(identifier: "TeamDetalis") as! TeamDetalisViewController
            
            self.navigationController?.pushViewController(detalisSc, animated: true)
            
        }
        
    }
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "resultCell",for: indexPath) as! ResultCell
        resultCell.teamOneImage.sd_setImage(with: URL(string: results[indexPath.row].home_team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        resultCell.teamOneName.text = results[indexPath.row].event_home_team
        resultCell.teamTwoImage.sd_setImage(with: URL(string: results[indexPath.row].away_team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        resultCell.TeamTwoLable.text = results[indexPath.row].event_away_team
        resultCell.resultDate.text = results[indexPath.row].event_date
        resultCell.resultTime.text = results[indexPath.row].event_time
        resultCell.scoreLable.text = results[indexPath.row].event_final_result
        resultCell.resultTableView.layer.cornerRadius = resultCell.frame.size.height / 5
        
        
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
