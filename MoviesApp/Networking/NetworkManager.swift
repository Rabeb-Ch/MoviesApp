//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import UIKit

class NetworkManager {

    static let sharedInstance = NetworkManager()
    static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static var addApiKey : String {
        return "?api_key=\(NetworkManager.apiKey)"
    }
    
    func fetchAPI<T:Decodable>(fromURL url : URL,forType type: T.Type,
                               completion : @escaping ((Result<T, Error>) -> Void)) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let objectToDecode = try decoder.decode(T.self, from: data)
                completion(.success(objectToDecode))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
