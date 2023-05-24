//
//  ViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 20/05/2023.
//

import UIKit

class FavViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var favoriteTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        favoriteTable.register(UINib(nibName: "FavAndLegueCell", bundle: nil), forCellReuseIdentifier: "FavAndLeageCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavAndLeageCell",for: indexPath) as! FavAndLegueCell
        
        cell.teamImgView.image = UIImage(named: "FootBall")
        cell.teamLabelName.text = "Barcelona"
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamDetailsSC = storyboard?.instantiateViewController(identifier: "TeamDetalis") as! TeamDetalisViewController
        
        self.navigationController?.pushViewController(teamDetailsSC, animated: true)
    }
    
 
    
    
    
    

}

