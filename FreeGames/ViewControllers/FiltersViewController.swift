//
//  FiltersViewController.swift
//  FreeGames
//
//  Created by Denis Bokov on 24.07.2024.
//

import UIKit

class FiltersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
        
        sheetPresentationController.delegate = self
        setupPresentationController()
    }
    
}

extension FiltersViewController: UISheetPresentationControllerDelegate {
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    private func setupPresentationController() {
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium()]
        sheetPresentationController.preferredCornerRadius = 24
    }
}
