//
//  ResultCell.swift
//  HeroApp
//
//  Created by Milad Soliman on 22/05/2023.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var TeamTwoLable: UILabel!
    @IBOutlet weak var teamTwoImage: UIImageView!
    @IBOutlet weak var resultDate: UILabel!
    @IBOutlet weak var resultTime: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var resultTableView: UIView!
    @IBOutlet weak var teamOneImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
