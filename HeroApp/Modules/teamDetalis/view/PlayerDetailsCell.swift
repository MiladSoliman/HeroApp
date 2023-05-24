//
//  PlayerDetailsCell.swift
//  HeroApp
//
//  Created by Milad Soliman on 21/05/2023.
//

import UIKit

class PlayerDetailsCell: UITableViewCell {

    @IBOutlet weak var playerCellView: UIView!
    @IBOutlet weak var playerPostition: UILabel!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
