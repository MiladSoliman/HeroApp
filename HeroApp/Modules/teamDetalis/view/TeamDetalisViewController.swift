//
//  TeamDetalisViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit

class TeamDetalisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TeamDetalsProtocle {
 
    
   
    @IBOutlet weak var playersTable: UITableView!
    @IBOutlet weak var teamCoach: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImgView: UIImageView!
    var playes:[Player] = []
  //  var team : [Team] = []
    var teamPressenter : TeamDeatlsPressenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        playersTable.dataSource = self
        playersTable.delegate = self
      //  pressenter = TeamDeatlsPressenter()
        teamPressenter.attachView(view: self)
        teamPressenter.getTeamDetails()
    /*   teamName.text = "Barcelona"
        teamCoach.text = "Xavi"
        teamImgView.image = UIImage(named: "FootBall")*/
    }

    func UpdatePage(teams: [Team]) {
       // self.team = teams
        self.playes = teams[0].players!
        DispatchQueue.main.async {
            self.teamName.text = teams[0].team_name
            self.teamCoach.text = teams[0].coaches![0].coach_name
            self.teamImgView.sd_setImage(with: URL(string: teams[0].team_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
            self.playersTable.reloadData()
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell",for: indexPath) as! PlayerDetailsCell
        
        cell.playerImgView.sd_setImage(with: URL(string: playes[indexPath.row].player_image ?? "FootBall"), placeholderImage: UIImage(named: "playerIcon"))
        cell.playerName.text = playes[indexPath.row].player_name
        cell.playerAge.text = playes[indexPath.row].player_number 
        cell.playerPostition.text = playes[indexPath.row].player_type!
        cell.playerCellView.layer.cornerRadius = cell.frame.height / 5
        cell.playerImgView.layer.cornerRadius = 50
      //  cell.playerImgView.image.layer.
       // cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
  
    @IBAction func addToFav(_ sender: UIButton) {
        print("Added To Favorite")
    }
}
