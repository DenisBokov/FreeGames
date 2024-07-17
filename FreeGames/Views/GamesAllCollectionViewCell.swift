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
        NetworkManager.shared.fetchImage(from: game.thumbnail) { [weak self] result in
            switch result {
            case .success(let image):
                guard let image = UIImage(data: image) else { return }
                self?.contentView.backgroundColor = UIColor(patternImage: image)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
