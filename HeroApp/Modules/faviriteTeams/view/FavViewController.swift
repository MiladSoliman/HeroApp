//
//  ViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 20/05/2023.
//

import UIKit

class FavViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,FavoriteProtocol {

    @IBOutlet weak var favoriteTable: UITableView!
    var savedTeams : [MySavedTeam] = []
    var favPresenter : FavoritePressenter!
    var deleted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        favoriteTable.register(UINib(nibName: "FavAndLegueCell", bundle: nil), forCellReuseIdentifier: "FavAndLeageCell")
       
        favPresenter = FavoritePressenter()
        favPresenter.attachView(view: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favPresenter.getFavTeams()
        favPresenter.getNetworkState()
        
    }
    
    
    func updateTable(favTeams: [MySavedTeam]) {
        self.savedTeams = favTeams
        DispatchQueue.main.async {
            self.favoriteTable.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTeams.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavAndLeageCell",for: indexPath) as! FavAndLegueCell
        
        cell.teamImgView.image = UIImage(data: savedTeams[indexPath.row].savedTeamImg )
        cell.teamLabelName.text = savedTeams[indexPath.row].savedTeamName
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(favPresenter.isOnline){
            let teamDetailsSC = storyboard?.instantiateViewController(identifier: "TeamDetalis") as! TeamDetalisViewController
            teamDetailsSC.teamPressenter = favPresenter.navigateToDetalisScreen(sportName: "football", teamId: savedTeams[indexPath.row].savedTeamId)
            self.navigationController?.pushViewController(teamDetailsSC, animated: true)
        }else{
            showNoInternetAlert()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let teamName = savedTeams[indexPath.row].savedTeamName
            let deleteAlert : UIAlertController = UIAlertController(title: "Information", message: "Are You Sure You Want To Delete This Team ", preferredStyle: .alert)
            deleteAlert.addAction(UIAlertAction(title: "Yes", style: .default , handler: { _ in
                self.deletMyFavTeam(name: teamName)
                self.savedTeams.remove(at: indexPath.row)
                self.favoriteTable.deleteRows(at: [indexPath], with: .left)
    
            }))
            deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(deleteAlert,animated: true,completion: nil)
  
        }
    }
    

    
    func deletMyFavTeam(name:String){
        favPresenter.deletTeamFromFav(removedTeamName: name)
        
    }
    
    
   
    func showNoInternetAlert(){
        let noConncAlert : UIAlertController = UIAlertController(title: "NO Internet", message: "Please Check Your Connection and Try Again", preferredStyle: .alert)
        noConncAlert.addAction(UIAlertAction(title: "Ok", style: .default ))
        self.present(noConncAlert,animated: true,completion: nil)
        
    }
    
    
    
    

}

