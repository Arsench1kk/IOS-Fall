//
//  FavoriteItemCell.swift
//  TableView
//
//  Created by Арсен Абдухалық on 14.11.2025.
//

import UIKit

class FavoriteItemCell: UITableViewCell {
    
    @IBOutlet weak var itemimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
