//
//  MainViewModel.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import Foundation

class MainViewModel {
    private(set) var products: [ProductViewModel] = []
    private(set) var filteredProducts: [ProductViewModel] = []
    private(set) var categories: [String] = []
    private(set) var cartItems: [ProductViewModel] = []
    private(set) var favorites: Set<Int> = []
    private(set) var errorMessage: String?
    private(set) var isLoading: Bool = false
    private(set) var selectedCategory: String?
    
    // Callbacks for UI updates
    var onProductsUpdated: (() -> Void)?
    var onCategoriesUpdated: (() -> Void)?
    var onCartUpdated: (() -> Void)?
    var onErrorOccurred: ((String) -> Void)?
    var onLoadingStateChanged: ((Bool) -> Void)?
    
    init() {
        fetchProducts()
        fetchCategories()
    }
    
    func fetchProducts() {
        self.isLoading = true
        onLoadingStateChanged?(true)
        NetworkService.shared.fetchProducts { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.onLoadingStateChanged?(false)
                
                switch result {
                case .success(let products):
                    self.products = products.map { ProductViewModel(product: $0) }
                    self.filteredProducts = self.products
                    self.onProductsUpdated?()
                    
                case .failure(let error):
                    self.errorMessage = error.message
                    self.onErrorOccurred?(error.message)
                }
            }
        }
    }
    
    func fetchCategories() {
        NetworkService.shared.fetchCategories { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(var categories):
                    categories.insert("All", at: 0)
                    self.categories = categories
                    self.onCategoriesUpdated?()
                    
                case .failure(let error):
                    self.errorMessage = error.message
                    self.onErrorOccurred?(error.message)
                }
            }
        }
    }
    
    func filterByCategory(_ category: String) {
        selectedCategory = category == "All" ? nil : category
        
        if let selectedCategory = selectedCategory {
            filteredProducts = products.filter { $0.category == selectedCategory }
        } else {
            filteredProducts = products
        }
        
        onProductsUpdated?()
    }
    
    func searchProducts(query: String) {
        if query.isEmpty {
            filterByCategory(selectedCategory ?? "All")
            return
        }
        
        let baseProducts = selectedCategory == nil ? products : products.filter { $0.category == selectedCategory }
        filteredProducts = baseProducts.filter {
            $0.title.lowercased().contains(query.lowercased()) ||
            $0.description.lowercased().contains(query.lowercased())
        }
        
        onProductsUpdated?()
    }
    
    func toggleFavorite(productId: Int) {
        if favorites.contains(productId) {
            favorites.remove(productId)
        } else {
            favorites.insert(productId)
        }
    }
    
    func isFavorite(productId: Int) -> Bool {
        return favorites.contains(productId)
    }
    
    func addToCart(product: ProductViewModel) {
        if !cartItems.contains(where: { $0.id == product.id }) {
            cartItems.append(product)
            onCartUpdated?()
        }
    }
    
    func removeFromCart(productId: Int) {
        cartItems.removeAll { $0.id == productId }
        onCartUpdated?()
    }
    
    func checkout() -> Bool {
        guard !cartItems.isEmpty else { return false }
        
        cartItems.removeAll()
        onCartUpdated?()
        return true
    }
    
    func getCartCount() -> Int {
        return cartItems.count
    }
    
    func getCartTotal() -> String {
        let total = cartItems.reduce(0.0) { sum, product in
            let priceString = product.price.replacingOccurrences(of: "$", with: "")
            let price = Double(priceString) ?? 0.0
            return sum + price
        }
        
        return String(format: "$%.2f", total)
    }
}
