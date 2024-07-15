//
//  GamesAllCollectionViewCell.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

class GamesAllCollectionViewCell: UICollectionViewCell {
    func configure(with game: FreeGames) {
        guard let url = URL(string: game.thumbnail) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                guard let image = UIImage(data: imageData) else { return }
                self?.contentView.backgroundColor = UIColor(patternImage: image)
            }
        }
    }
}
