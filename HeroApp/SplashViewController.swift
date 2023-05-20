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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       /* splashView.contentMode = .scaleAspectFit
        splashView.loopMode = .loop
        splashView.play()*/
        let animationView = LottieAnimationView(name: "splash")
      //  let animationView = LottiAnimationView(name: "your_animation_file_name")
       // animationView.frame = CGRect(x: 10, y: 400, width: 200, height: 200)
        animationView.center = splashView.center
        splashView.addSubview(animationView)
       
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3.3){
            let home = self.storyboard?.instantiateViewController(identifier: "HomeScreen") as! UITabBarController
                                   home.modalPresentationStyle = .fullScreen
                                   home.modalTransitionStyle = .crossDissolve
                                   self.present(home, animated: true)
            
        }
        
        
       /* Timer.scheduledTimer(timeInterval: 5, target: self, @selector: @selector(changeScreen), userInfo: nil, repeats: false)*/
        
    }
    
    func changeScreen(){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
