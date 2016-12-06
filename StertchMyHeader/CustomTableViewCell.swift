//
//  CustomTableViewCell.swift
//  StertchMyHeader
//
//  Created by Suvan Ramani on 2016-12-06.
//  Copyright © 2016 suvanr. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell()
    {
        categoryLabel.text = "World"
        headlineLabel.text = "Climate change protests, divestments meet fossil fuels realities"
    }

}
