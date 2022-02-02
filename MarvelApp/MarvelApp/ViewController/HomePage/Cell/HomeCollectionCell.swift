//
//  HomeCollectionCell.swift
//  MarvelApp
//
//  Created by Asit Aslan on 31.01.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

protocol HomeCollectionDelegate: AnyObject {
    func favButton(isFav: Bool, charactersResult: CharactersResult)
}

class HomeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabl: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    weak var delegate: HomeCollectionDelegate?
    
    var characters: CharactersResult! {
        didSet {
            characterNameLabl.text = characters.name
            characterImageView.downloadImage(from: characters.thumbnail?.path ?? "")
            favButton.isSelected = StorageManager.getFav(charactersResult: characters) ?? false
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterNameLabl.text = ""
        characterImageView.image = UIImage()
    }
    @IBAction func favButton(_ sender: UIButton) {
        favButton.isSelected.toggle()
        delegate?.favButton(isFav: favButton.isSelected, charactersResult: characters)
    }
}
