//
//  LeaguesViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,LeaguesProtocol, UISearchBarDelegate {

    var sportNum : Int?
    var sportName:String?
    @IBOutlet weak var leaguesTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var leaguePresenter:LeaguePresenter!
    var leageus : [League] = []
    var filtterdLeagues : [League] = []
    var isSeareched = false
    
    let networkIndicator=UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguePresenter = LeaguePresenter()
      
        switch(sportNum){
        case 0 :
            leaguePresenter.sportName = "football"
        case 1:
            leaguePresenter.sportName = "basketball"
        case 2:
            leaguePresenter.sportName = "tennis"
        case 3 :
            leaguePresenter.sportName = "cricket"
        default:
            leaguePresenter.sportName = "football"
        }
        networkIndicator.color = UIColor.gray
        networkIndicator.center=view.center
        networkIndicator.startAnimating()
        view.addSubview(networkIndicator)
        leaguesTable.dataSource = self
        leaguesTable.delegate = self
        searchBar.delegate = self
        leaguesTable.register(UINib(nibName: "FavAndLegueCell", bundle: nil), forCellReuseIdentifier: "FavAndLeageCell")
        leaguePresenter.attatchView(view: self)
        leaguePresenter.getAllLeagues()
    }
    
    
    func updateTable(leagues: [League]) {
        self.leageus = leagues
        DispatchQueue.main.async {
            self.leaguesTable.reloadData()
            self.networkIndicator.stopAnimating()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isSeareched {
            return leageus.count
        }else{
            return filtterdLeagues.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavAndLeageCell",for: indexPath) as! FavAndLegueCell
        if !isSeareched {
            cell.teamLabelName.text = leageus[indexPath.row].league_name
            cell.teamImgView.sd_setImage(with: URL(string: leageus[indexPath.row].league_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
        } else{
            cell.teamLabelName.text = filtterdLeagues[indexPath.row].league_name
            cell.teamImgView.sd_setImage(with: URL(string: filtterdLeagues[indexPath.row].league_logo ?? "FootBall"), placeholderImage: UIImage(named: "sport"))
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if(leaguePresenter.getNetworkState()){
            
            if isSeareched {
                leaguePresenter.leagueId = filtterdLeagues[indexPath.row].league_key ?? 3
            }else{
                leaguePresenter.leagueId = leageus[indexPath.row].league_key ?? 3
            }
            
            
            
            let LeagDetalisSc = self.storyboard?.instantiateViewController(identifier: "LeagueDetalis") as! LeagueDetailsViewController
            
            LeagDetalisSc.presenter = leaguePresenter.getPressentr()
            
            self.navigationController?.pushViewController(LeagDetalisSc, animated: true)
        }else{
            showNoInternetAlert()
            
        }
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            isSeareched = true
            filtterdLeagues.removeAll()
            filtterdLeagues = leageus.filter{leage in return (leage.league_name!.lowercased().contains(searchText.lowercased()))
            }
            }else{
                isSeareched = false
                filtterdLeagues.removeAll()
            }
            leaguesTable.reloadData()
      
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: -50, y: 0)
        
      
        UIView.animate(withDuration: 0.3, delay: 0.05 * Double(indexPath.row), options: [.curveEaseInOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
    
    
    
    func showNoInternetAlert(){
        let noConncAlert : UIAlertController = UIAlertController(title: "NO Internet", message: "Please Check Your Connection and Try Again", preferredStyle: .alert)
        noConncAlert.addAction(UIAlertAction(title: "Ok", style: .default ))
        self.present(noConncAlert,animated: true,completion: nil)
        
    }
    
}
