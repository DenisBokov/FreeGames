//
//  GamesAllCollectionViewCell.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

class GamesAllCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    func setupCollectionView() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 3.0
    }
    
    func configure(with game: FreeGames) {
        guard let url = URL(string: game.thumbnail) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                guard let image = UIImage(data: imageData) else { return }
                self?.contentView.backgroundColor = UIColor(patternImage: image)
                self?.activityIndicator.stopAnimating()
            }
        }
    }
}
