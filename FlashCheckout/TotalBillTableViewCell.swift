//
//  TotalBillTableViewCell.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-27.
//

import UIKit

class TotalBillTableViewCell: UITableViewCell {

    @IBOutlet weak var total: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        contentView.backgroundColor = UIColor(named:"main")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
