//
//  RMCharacterListView.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 09.11.2023.
//

import UIKit

final class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.hidesWhenStopped = true
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(self.collectionView, self.loader)
        self.setUpConstraints()
        
        self.loader.startAnimating()
        self.viewModel.fetchCharactersList()
        self.setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            self.loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.loader.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.loader.heightAnchor.constraint(equalToConstant: 100),
            self.loader.widthAnchor.constraint(equalToConstant: 100),
            
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        self.collectionView.dataSource = viewModel
        self.collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.loader.stopAnimating()
            self.collectionView.isHidden = false
            
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
    
}
