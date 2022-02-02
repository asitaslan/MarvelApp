//
//  FavoritesTableCellVC.swift
//  MarvelApp
//
//  Created by Asit Aslan on 31.01.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

class FavoritesTableCell: UITableViewCell {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    
    var item: Favorite! {
        didSet {
            characterImageView.downloadImage(from: item.charactersResult.thumbnail?.path ?? "")
            characterNameLbl.text = item.charactersResult.name ?? ""
        }
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
