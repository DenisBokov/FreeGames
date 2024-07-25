//
//  GamesAllCollectionViewCell.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

class GamesAllCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var imageURL: URL? {
        didSet {
            contentView.backgroundColor = nil
            updateImage()
        }
    }
    
    func setupCollectionView() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 3.0
    }
    
    func configure(with game: FreeGames) {
        imageURL = URL(string: game.thumbnail)
    }
    
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        getImage(from: imageURL) { [weak self] result in
            switch result {
            case .success(let image):
                if imageURL == self?.imageURL {
                    self?.contentView.backgroundColor = UIColor(patternImage: image)
                    self?.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from url: URL, complition: @escaping(Result<UIImage, Error>) -> Void) {
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.absoluteString as NSString) {
            print("Картинка из кэша: \(url)")
            complition(.success(cachedImage))
            return
        }
        
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let image = UIImage(data: image) else { return }
                ImageCacheManager.shared.setObject(image, forKey: url.absoluteString as NSString)
                print("Картинка из сети интернет: \(url)")
                complition(.success(image))
            case .failure(let error):
                print(error)
            }
        }
    }
}
