//
//  GamesAllCollectionViewCell.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

class GamesAllCollectionViewCell: UICollectionViewCell {
    @IBOutlet var nameGameLabel: UILabel!
    
    func configure(with game: FreeGames) {
        nameGameLabel.text = game.title
    }
}
