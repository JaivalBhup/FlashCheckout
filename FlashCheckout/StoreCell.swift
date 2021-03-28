//
//  StoreCell.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-27.
//

import UIKit

class StoreCell: UITableViewCell {

    @IBOutlet weak var MainImg: UIImageView!
    @IBOutlet weak var TopLab: UILabel!
    @IBOutlet weak var BottomLab: UILabel!
    @IBOutlet weak var disclosureImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
