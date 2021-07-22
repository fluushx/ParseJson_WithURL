//
//  WeatherForescastViewCell.swift
//  ParseJson_WithURL
//
//  Created by Felipe Ignacio Zapata Riffo on 22-07-21.
//

import UIKit

class WeatherForescastViewCell: UITableViewCell {

    @IBOutlet weak var transparencyLabel: UILabel!
    @IBOutlet weak var seeingLabel: UILabel!
    @IBOutlet weak var cloudcoverLabel: UILabel!
    @IBOutlet weak var timepointLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
