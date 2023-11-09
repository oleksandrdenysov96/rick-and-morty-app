//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import Foundation



/// Unique API endpoint obj
@frozen enum RMEndpoint: String {
    case character = "character"
    case location = "location"
    case episode = "episode"
}

