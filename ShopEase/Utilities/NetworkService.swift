//
//  NetworkService.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case httpError(Int)
    case unknown(Error)
    
    var message: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode data"
        case .httpError(let code):
            return "HTTP Error: \(code)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchProducts(completion: @escaping (Result<[ProductResponse], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.httpError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([ProductResponse].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchCategories(completion: @escaping (Result<[String], NetworkError>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([String].self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
