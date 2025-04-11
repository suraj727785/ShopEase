//
//  ProductViewModel.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//

import Foundation

class ProductViewModel {
    private let product: ProductResponse
    
    init(product: ProductResponse) {
        self.product = product
    }
    
    var id: Int {
        return product.id
    }
    
    var title: String {
        return product.title
    }
    
    var price: String {
        return "$\(String(format: "%.2f", product.price))"
    }
    
    var description: String {
        return product.description
    }
    
    var category: String {
        return product.category
    }
    
    var imageURL: URL? {
        return URL(string: product.image)
    }
    
    var ratingText: String {
        return String(format: "%.1f", product.rating.rate)
    }
    
    var ratingCount: String {
        return "\(product.rating.count) reviews"
    }
    
    var ratingPercentage: String {
        return "\(Int(product.rating.rate * 20))%"
    }
}
