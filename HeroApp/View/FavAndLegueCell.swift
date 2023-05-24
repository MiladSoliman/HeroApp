//
//  FavAndLegueCell.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit

class FavAndLegueCell: UITableViewCell {

    @IBOutlet weak var teamLabelName: UILabel!
    @IBOutlet weak var teamImgView: UIImageView!
    @IBOutlet weak var favView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.teamImgView.layer.cornerRadius = 50 //teamImgView.frame.size.width / 2
        self.teamImgView.layer.masksToBounds = true
        teamImgView.clipsToBounds = true
        
        favView.layer.cornerRadius = favView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
