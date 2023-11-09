//
//  RMTabViewController.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .cyan
        self.setUpTabs()

    }

    
    private func setUpTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        for controller in [characterVC, locationVC, episodeVC, settingsVC] {
            controller.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        let navigationControllers = [
            UINavigationController(rootViewController: characterVC),
            UINavigationController(rootViewController: locationVC),
            UINavigationController(rootViewController: episodeVC),
            UINavigationController(rootViewController: settingsVC)
        ]
        
        navigationControllers[0].tabBarItem = UITabBarItem(
            title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        
        navigationControllers[1].tabBarItem = UITabBarItem(
            title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        
        navigationControllers[2].tabBarItem = UITabBarItem(
            title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        
        navigationControllers[3].tabBarItem = UITabBarItem(
            title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for navigationController in navigationControllers {
            navigationController.navigationBar.prefersLargeTitles = true
        }

        self.setViewControllers(navigationControllers, animated: true)
    }
}

