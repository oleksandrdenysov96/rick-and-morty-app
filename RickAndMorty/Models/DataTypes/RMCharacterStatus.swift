//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
