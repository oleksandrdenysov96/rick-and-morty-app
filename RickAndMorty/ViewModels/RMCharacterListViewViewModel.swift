//
//  RMCharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 09.11.2023.
//

import Foundation
import UIKit

final class RMCharacterListViewViewModel: NSObject {
    
    func fetchCharactersList() {
        RMService.shared.execute(.listOfCharactersRequest,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}

// MARK: DataSource / Delegate

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// Configuring custom cell
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        let model = RMCharacterCollectionViewCellViewModel(characterName: "Alex",
                                                           characterStatus: .alive,
                                                           characterImageUrl: nil)
        cell.configure(with: model)
        return cell
    }
    
    
    /// Fast "adaptive" cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenBounds = UIScreen.main.bounds
        let itemReference = (screenBounds.width - 30) / 2
        return CGSize(width: itemReference, height: itemReference * 1.5)
    }
    
    
}
