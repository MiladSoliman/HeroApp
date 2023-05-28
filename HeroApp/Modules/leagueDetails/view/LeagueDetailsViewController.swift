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
    var events : [LeagueDetalisView] = []
    var results : [LeagueDetalisView] = []
    var teams : [Team] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingColliction.dataSource = self
        upcomingColliction.delegate = self
        resultTable.delegate = self
        resultTable.dataSource = self
        teamColliction.dataSource = self
        teamColliction.delegate = self
        presenter.attachView(view: self)
        presenter.getUpComingEvents()
        presenter.getLastResults()
        presenter.getTeams()
        
    }
    func updateUpComingColl(events: [LeagueDetalisView]) {
        self.events = events
        DispatchQueue.main.async {
            self.upcomingColliction.reloadData()
        }
       // print(events[0].event_away_team!) // real madrid
    }
    
    func updateResultTable(results: [LeagueDetalisView]) {
        self.results = results
        DispatchQueue.main.async {
            self.resultTable.reloadData()
        }
      //  print(results[0].event_final_result!) // 4-0
    }
    
    func updateTeamsColl(teams: [Team]) {
        self.teams = teams
        DispatchQueue.main.async {
            self.teamColliction.reloadData()
        }
      //  print(teams[0].team_name!) // Byern
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
            upComingCell.teamOneImgV.sd_setImage(with: URL(string: events[indexPath.row].teamHomeImg ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
            upComingCell.teamOneName.text = events[indexPath.row].teamHomeName
            upComingCell.teamTowImgV.sd_setImage(with: URL(string: events[indexPath.row].teamAwatImg ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
            upComingCell.teamTwoName.text = events[indexPath.row].teamAwayName
            upComingCell.eventDate.text = events[indexPath.row].date
            upComingCell.eventTime.text = events[indexPath.row].time
           upComingCell.upcmoingCellView.layer.cornerRadius = upComingCell.frame.size.height / 5
        
            
            return upComingCell
        }else {
            
            let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamColCell", for: indexPath) as! TeamCollectionViewCell
            teamCell.teamImageView.sd_setImage(with: URL(string: teams[indexPath.row].team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
           teamCell.teamImageView.layer.cornerRadius = 50
         //   teamCell.teamImageView.layer.borderColor = UIColor.red.cgColor
           teamCell.teamCellView.layer.cornerRadius = teamCell.frame.size.height / 5
            return teamCell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamColliction {
            if presenter.sportName == "football"{
                presenter.teamId = teams[indexPath.row].team_key
                let detalisSc = storyboard?.instantiateViewController(identifier: "TeamDetalis") as! TeamDetalisViewController
                
                detalisSc.teamPressenter = presenter.setTeamDetailsData()
                
                self.navigationController?.pushViewController(detalisSc, animated: true)
            }else{
                showAlert()
                print("No Detalis")
            }
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "resultCell",for: indexPath) as! ResultCell
        resultCell.teamOneImage.sd_setImage(with: URL(string: results[indexPath.row].teamHomeImg ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        resultCell.teamOneImage.layer.cornerRadius = 30
        resultCell.teamOneName.text = results[indexPath.row].teamHomeName
        resultCell.teamTwoImage.sd_setImage(with: URL(string: results[indexPath.row].teamAwatImg ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        resultCell.teamTwoImage.layer.cornerRadius = 30
        resultCell.TeamTwoLable.text = results[indexPath.row].teamAwayName
        resultCell.resultDate.text = results[indexPath.row].date
        resultCell.resultTime.text = results[indexPath.row].time
        resultCell.scoreLable.text = results[indexPath.row].result
        resultCell.resultTableView.layer.cornerRadius = resultCell.frame.size.height / 5
        
        
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    func showAlert(){
        let ndDataAlert : UIAlertController = UIAlertController(title: "Information", message: "Sorry There Is No Data For This Team", preferredStyle: .alert)
        ndDataAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(ndDataAlert,animated: true,completion: nil)
        
    }
    

}
