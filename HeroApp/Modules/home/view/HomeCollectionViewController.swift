//
//  HomeCollectionViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 20/05/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    var homePressenter : HomePressenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePressenter = HomePressenter()
        homePressenter.getNetworkState()
    }
    
    var homeSports : [String] = ["FootBall","BasketBall","Tennis","Ckricket"]
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return homeSports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        // Configure the cell
        
        cell.homeLabel.text = homeSports[indexPath.row]
        cell.homeImageView.image = UIImage(named: homeSports[indexPath.row])
        cell.layer.cornerRadius = cell.frame.height / 10
        cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.48), height: (collectionView.bounds.width*0.85))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 5, bottom: 5, right: 5)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (homePressenter.isOnline){
            print(indexPath.row)
            let leaguesSC = storyboard?.instantiateViewController(identifier: "LeaguesScreen") as! LeaguesViewController
            leaguesSC.sportNum = indexPath.row
            
            self.navigationController?.pushViewController(leaguesSC, animated: true)
        }else{
            print("No Connection")
            showNoInternetAlert()
            
        }
        
        
        
    }
    

    func showNoInternetAlert(){
        let noConncAlert : UIAlertController = UIAlertController(title: "NO Internet", message: "Please Check Your Connection and Try Again", preferredStyle: .alert)
        noConncAlert.addAction(UIAlertAction(title: "Ok", style: .default ))
        self.present(noConncAlert,animated: true,completion: nil)
        
    }
    
 
    
}
