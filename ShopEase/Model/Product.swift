//
//  Product.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import Foundation

struct ProductResponse: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
