//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    private let charactersListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(charactersListView)
        self.title = "Characters"
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            charactersListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            charactersListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            charactersListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            charactersListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    

}
