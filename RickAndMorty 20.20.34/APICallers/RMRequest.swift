//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import Foundation


/// Single API call obj
final class RMRequest {

//    static let shared = RMRequest()
    
    
    private struct Constants {
        
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructing URL
    private var urlString: String {
        var url = "\(Constants.baseUrl)/\(endpoint.rawValue)"
        
        /// Adding path components
        if !pathComponents.isEmpty {
            pathComponents.forEach { component in
                url += "/\(component)"
            }
        }
        
        /// Adding params
        if !queryParameters.isEmpty {
            let argsString = queryParameters.compactMap { param in    // MARK: Learn compactMap!
                guard let value = param.value else { return nil }
                return "\(param.name)=\(value)"
            }.joined(separator: "&")
            
            url += "?\(argsString)"
        }
        return url
    }
    
    public var url: URL? {
        return URL(string: self.urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }

    
    
    
}


extension RMRequest {
    static let listOfCharactersRequest = RMRequest(endpoint: .character)
}
