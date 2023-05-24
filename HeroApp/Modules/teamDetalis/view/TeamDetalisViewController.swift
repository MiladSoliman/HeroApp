//
//  TeamDetalisViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit

class TeamDetalisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var playersTable: UITableView!
    @IBOutlet weak var teamCoach: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playersTable.dataSource = self
        playersTable.delegate = self
        teamName.text = "Barcelona"
        teamCoach.text = "Xavi"
        teamImgView.image = UIImage(named: "FootBall")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 26
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell",for: indexPath) as! PlayerDetailsCell
        
        cell.playerImgView.image = UIImage(named: "FootBall")
        cell.playerName.text = "Milad Soliman"
        cell.playerAge.text = "24"
        cell.playerPostition.text = "Stricker"
        cell.playerCellView.layer.cornerRadius = cell.frame.height / 5
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
