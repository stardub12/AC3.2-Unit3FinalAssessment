//
//  TableViewCell.swift
//  VictoriaAlbert
//
//  Created by Simone Grant on 11/10/16.
//  Copyright © 2016 Simone Grant. All rights reserved.
//

import UIKit

class VATableViewCell: UITableViewCell {
    
    @IBOutlet weak var ringImage: UIImageView!
    @IBOutlet weak var ringTitle: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
