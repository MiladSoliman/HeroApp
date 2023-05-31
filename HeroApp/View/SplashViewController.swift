//
//  SplashViewController.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    @IBOutlet weak var splashView: UIView!
    
    @IBOutlet weak var heroAppLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let animationView = LottieAnimationView(name: "splash")
     
        animationView.center = splashView.center
        splashView.addSubview(animationView)
       
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3.3){
            let home = self.storyboard?.instantiateViewController(identifier: "HomeScreen") as! UITabBarController
                                   home.modalPresentationStyle = .fullScreen
                                   home.modalTransitionStyle = .crossDissolve
                                   self.present(home, animated: true)
            
        }
        
        
        heroAppLabel.alpha = 0
        heroAppLabel.transform = CGAffineTransform(translationX: 0, y: 500)

        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.heroAppLabel.alpha = 1
            self.heroAppLabel.transform = .identity
        }, completion: nil)
        
    
        
    }
 

}
