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
        
        guard let url = URL(string: game.thumbnail) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.contentView.backgroundColor = UIColor(patternImage: UIImage(data: imageData)!)
            }
        }
    }
}
