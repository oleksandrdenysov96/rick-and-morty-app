//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 08.11.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    
    // Already created model, all we need - pass them as an array
    let results: [RMCharacter]
}

