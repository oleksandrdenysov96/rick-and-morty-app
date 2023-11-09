//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 09.11.2023.
//

import Foundation
import UIKit

final class CharacterListViewViewModel: NSObject {
    
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

extension CharacterListViewViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    
}
