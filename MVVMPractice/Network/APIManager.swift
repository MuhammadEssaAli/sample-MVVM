//
//  APIManager.swift
//  MVVMPractice
//
//  Created by Essa on 13/06/2024.
//

import Foundation

enum DataError : Error {
    case invalidRequest
    case invalidData
    case invalidDecoding
    case message(_ error :Error?)
}


final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func getRequest<T:Decodable>(modelType : T.Type, endpointType : EndPointType,completion: @escaping(Result<T, DataError>) -> Void) {
        guard let url = URL(string: endpointType.path) else {
            completion(.failure(.invalidRequest))
            return }
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard let data , error == nil  else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                completion(.failure(.invalidRequest))
                return
                 }
            
            
            do {
                let products = try JSONDecoder().decode(modelType.self,from:data)
                completion(.success(products))
            } catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
    
}
