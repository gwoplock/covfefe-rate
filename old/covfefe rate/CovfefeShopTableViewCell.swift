//
//  CovfefeShopTableViewCell.swift
//  covfefe rate
//
//  Created by Garrett Battaglia on 3/6/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import UIKit

class CovfefeShopTableViewCell: UITableViewCell {
    //MARK: Properties

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rate: UIStackView!
    
    private func loadSampleMeals() {
     guard let test = CovfefeShop()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
