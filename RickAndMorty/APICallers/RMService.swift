//
//  RMService.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 07.11.2023.
//

import Foundation



/// Primary API Service obj
final class RMService {
    
    static let shared = RMService()
    
    
    /// Protection due to singletone
    private init() {}
    
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    /// - Parameters:
    ///   - request: instance of request with all data
    ///   - type: generic, that provides type flexibility
    ///   - completion: common response callback
    
    public func execute<T: Codable>(
        _ request: RMRequest, 
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        /// Creating URLRequest
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        /// Creating URLSession.dataTask
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            /// Decode a response with needed model type
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                /// throwing a decoded RMModel of needed type
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        /// Don't forget to resume task after configuring it!
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
    
}
