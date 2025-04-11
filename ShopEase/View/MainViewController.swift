//
//  MainViewController.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Components
    private let navigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bag.fill")
        imageView.tintColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Sector 69, Gurgaon"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search the entire shop"
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = UIColor.systemGray6
        searchBar.layer.cornerRadius = 10
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartBadgeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemRed
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeAllCategoriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let flashSaleLabel: UILabel = {
        let label = UILabel()
        label.text = "Flash Sale"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeAllProductsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = (UIScreen.main.bounds.width - 48) / 2
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let tabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let catalogButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartTabBadgeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemRed
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let viewModel = MainViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionViews()
        bindViewModel()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        // Add subviews
        view.addSubview(navigationBar)
        navigationBar.addSubview(logoImageView)
        navigationBar.addSubview(addressLabel)
        navigationBar.addSubview(notificationButton)
        
        view.addSubview(searchBar)
        
        view.addSubview(categoriesLabel)
        view.addSubview(seeAllCategoriesButton)
        view.addSubview(categoriesCollectionView)
        
        view.addSubview(flashSaleLabel)
        view.addSubview(seeAllProductsButton)
        view.addSubview(productsCollectionView)
        
        view.addSubview(tabBar)
        tabBar.addSubview(homeButton)
        tabBar.addSubview(catalogButton)
        tabBar.addSubview(cartTabButton)
        tabBar.addSubview(cartTabBadgeLabel)
        tabBar.addSubview(favoritesButton)
        tabBar.addSubview(profileButton)
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 60),
            
            logoImageView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
            logoImageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 32),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
            
            addressLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 12),
            addressLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            
            notificationButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16),
            notificationButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            notificationButton.widthAnchor.constraint(equalToConstant: 32),
            notificationButton.heightAnchor.constraint(equalToConstant: 32),
            
            searchBar.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
            categoriesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllCategoriesButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
            seeAllCategoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 8),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            flashSaleLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 16),
            flashSaleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllProductsButton.centerYAnchor.constraint(equalTo: flashSaleLabel.centerYAnchor),
            seeAllProductsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            productsCollectionView.topAnchor.constraint(equalTo: flashSaleLabel.bottomAnchor, constant: 8),
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productsCollectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -8),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 64),
            
            homeButton.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 32),
            homeButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 32),
            homeButton.heightAnchor.constraint(equalToConstant: 32),
            
            catalogButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor, constant: 48),
            catalogButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor),
            catalogButton.widthAnchor.constraint(equalToConstant: 32),
            catalogButton.heightAnchor.constraint(equalToConstant: 32),
            
            cartTabButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            cartTabButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor),
            cartTabButton.widthAnchor.constraint(equalToConstant: 32),
            cartTabButton.heightAnchor.constraint(equalToConstant: 32),
            
            cartTabBadgeLabel.topAnchor.constraint(equalTo: cartTabButton.topAnchor, constant: -5),
            cartTabBadgeLabel.trailingAnchor.constraint(equalTo: cartTabButton.trailingAnchor, constant: 5),
            cartTabBadgeLabel.widthAnchor.constraint(equalToConstant: 20),
            cartTabBadgeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            favoritesButton.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor, constant: -48),
            favoritesButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor),
            favoritesButton.widthAnchor.constraint(equalToConstant: 32),
            favoritesButton.heightAnchor.constraint(equalToConstant: 32),
            
            profileButton.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -32),
            profileButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 32),
            profileButton.heightAnchor.constraint(equalToConstant: 32),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        cartTabButton.addTarget(self, action: #selector(openCart), for: .touchUpInside)
        searchBar.delegate = self
    }
    
    private func configureCollectionViews() {
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        productsCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.onProductsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
            }
        }
        
        viewModel.onCategoriesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.categoriesCollectionView.reloadData()
            }
        }
        
        viewModel.onCartUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.updateCartBadge()
            }
        }
        
        viewModel.onErrorOccurred = { [weak self] message in
            DispatchQueue.main.async {
                self?.showErrorAlert(message: message)
            }
        }
        
        viewModel.onLoadingStateChanged = { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private func updateCartBadge() {
        let count = viewModel.getCartCount()
        
        cartTabBadgeLabel.text = "\(count)"
        cartTabBadgeLabel.isHidden = count == 0
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func openCart() {
        let cartVC = CartViewController(viewModel: viewModel)
        navigationController?.pushViewController(cartVC, animated: true)
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return viewModel.categories.count
        } else {
            return viewModel.filteredProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: viewModel.categories[indexPath.item])
            
            // Set selected for "All" category by default
            if indexPath.item == 0 && viewModel.selectedCategory == nil {
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            let product = viewModel.filteredProducts[indexPath.item]
            
            cell.configure(with: product, isFavorite: viewModel.isFavorite(productId: product.id))
            
            cell.favoriteAction = { [weak self] in
                self?.viewModel.toggleFavorite(productId: product.id)
                collectionView.reloadItems(at: [indexPath])
            }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            let category = viewModel.categories[indexPath.item]
            viewModel.filterByCategory(category)
        } else {
            let product = viewModel.filteredProducts[indexPath.item]
            let detailVC = ProductDetailViewController(viewModel: product, mainViewModel: viewModel)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchProducts(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
