//
//  CartViewController.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import UIKit

class CartViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: MainViewModel
    
    // MARK: - UI Components
    private let navigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cart"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addressView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Sector 69, Gurgaon"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let selectAllView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectAllCheckbox: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let selectAllLabel: UILabel = {
        let label = UILabel()
        label.text = "Select all"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let checkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.85, green: 0.9, blue: 0.3, alpha: 1.0)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.backgroundColor = .white
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private let emptyCartView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emptyCartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cart")
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.text = "Your cart is empty"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startShoppingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Shopping", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialization
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabBar()
        setupTableView()
        setupActions()
        updateUI()
        
        viewModel.onCartUpdated = { [weak self] in
            self?.updateUI()
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor.systemGray6
        
        // Add UI components to view hierarchy
        view.addSubview(navigationBar)
        navigationBar.addSubview(titleLabel)
        navigationBar.addSubview(menuButton)
        
        view.addSubview(addressView)
        addressView.addSubview(locationIcon)
        addressView.addSubview(addressLabel)
        addressView.addSubview(chevronIcon)
        
        view.addSubview(selectAllView)
        selectAllView.addSubview(selectAllCheckbox)
        selectAllView.addSubview(selectAllLabel)
        selectAllView.addSubview(shareButton)
        selectAllView.addSubview(editButton)
        
        view.addSubview(tableView)
        view.addSubview(checkoutButton)
        view.addSubview(tabBar)
        
        view.addSubview(emptyCartView)
        emptyCartView.addSubview(emptyCartImageView)
        emptyCartView.addSubview(emptyCartLabel)
        emptyCartView.addSubview(startShoppingButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Navigation bar
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
            
            menuButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16),
            menuButton.widthAnchor.constraint(equalToConstant: 24),
            menuButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Address view
            addressView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addressView.heightAnchor.constraint(equalToConstant: 50),
            
            locationIcon.centerYAnchor.constraint(equalTo: addressView.centerYAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 16),
            locationIcon.widthAnchor.constraint(equalToConstant: 16),
            locationIcon.heightAnchor.constraint(equalToConstant: 16),
            
            addressLabel.centerYAnchor.constraint(equalTo: addressView.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 8),
            
            chevronIcon.centerYAnchor.constraint(equalTo: addressView.centerYAnchor),
            chevronIcon.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -16),
            chevronIcon.widthAnchor.constraint(equalToConstant: 12),
            chevronIcon.heightAnchor.constraint(equalToConstant: 12),
            
            // Select all view
            selectAllView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 16),
            selectAllView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectAllView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectAllView.heightAnchor.constraint(equalToConstant: 50),
            
            selectAllCheckbox.centerYAnchor.constraint(equalTo: selectAllView.centerYAnchor),
            selectAllCheckbox.leadingAnchor.constraint(equalTo: selectAllView.leadingAnchor, constant: 16),
            selectAllCheckbox.widthAnchor.constraint(equalToConstant: 24),
            selectAllCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            selectAllLabel.centerYAnchor.constraint(equalTo: selectAllView.centerYAnchor),
            selectAllLabel.leadingAnchor.constraint(equalTo: selectAllCheckbox.trailingAnchor, constant: 8),
            
            editButton.centerYAnchor.constraint(equalTo: selectAllView.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: selectAllView.trailingAnchor, constant: -16),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24),
            
            shareButton.centerYAnchor.constraint(equalTo: selectAllView.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Table view
            tableView.topAnchor.constraint(equalTo: selectAllView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -16),
            
            // Checkout button
            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            checkoutButton.heightAnchor.constraint(equalToConstant: 50),
            checkoutButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -16),
            
            // Tab bar
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 50),
            
            emptyCartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCartView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            emptyCartView.widthAnchor.constraint(equalToConstant: 200),
            emptyCartView.heightAnchor.constraint(equalToConstant: 200),
            
            emptyCartImageView.topAnchor.constraint(equalTo: emptyCartView.topAnchor),
            emptyCartImageView.centerXAnchor.constraint(equalTo: emptyCartView.centerXAnchor),
            emptyCartImageView.widthAnchor.constraint(equalToConstant: 80),
            emptyCartImageView.heightAnchor.constraint(equalToConstant: 80),
            
            emptyCartLabel.topAnchor.constraint(equalTo: emptyCartImageView.bottomAnchor, constant: 16),
            emptyCartLabel.centerXAnchor.constraint(equalTo: emptyCartView.centerXAnchor),
            emptyCartLabel.leadingAnchor.constraint(equalTo: emptyCartView.leadingAnchor),
            emptyCartLabel.trailingAnchor.constraint(equalTo: emptyCartView.trailingAnchor),
            
            startShoppingButton.topAnchor.constraint(equalTo: emptyCartLabel.bottomAnchor, constant: 16),
            startShoppingButton.centerXAnchor.constraint(equalTo: emptyCartView.centerXAnchor),
            startShoppingButton.widthAnchor.constraint(equalToConstant: 150),
            startShoppingButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupTabBar() {
        let homeItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let catalogItem = UITabBarItem(title: "Catalog", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
        let cartItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart.fill"), tag: 2)
        let favoritesItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 3)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 4)
        
        tabBar.items = [homeItem, catalogItem, cartItem, favoritesItem, profileItem]
        tabBar.selectedItem = cartItem
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartItemTableViewCell.self, forCellReuseIdentifier: CartItemTableViewCell.identifier)
    }
    
    private func setupActions() {
        selectAllCheckbox.addTarget(self, action: #selector(selectAllTapped), for: .touchUpInside)
        checkoutButton.addTarget(self, action: #selector(checkoutTapped), for: .touchUpInside)
        startShoppingButton.addTarget(self, action: #selector(startShoppingTapped), for: .touchUpInside)
    }
    
    // MARK: - UI Updates
    private func updateUI() {
        let cartItems = viewModel.cartItems
        emptyCartView.isHidden = !cartItems.isEmpty
        selectAllView.isHidden = cartItems.isEmpty
        tableView.isHidden = cartItems.isEmpty
        checkoutButton.isHidden = cartItems.isEmpty
        if !cartItems.isEmpty {
            checkoutButton.setTitle("Checkout (\(viewModel.getCartTotal()))", for: .normal)
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @objc private func selectAllTapped() {
        selectAllCheckbox.isSelected.toggle()
        // Add logic to select/deselect all items
    }
    
    @objc private func checkoutTapped() {
        if viewModel.checkout() {
            showThankYouPopup()
        }
    }
    
    @objc private func startShoppingTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func showThankYouPopup() {
        let alertController = UIAlertController(title: "Thank You!", message: "Your order has been placed successfully.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }))
        present(alertController, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemTableViewCell.identifier, for: indexPath) as? CartItemTableViewCell else {
            return UITableViewCell()
        }
        
        let product = viewModel.cartItems[indexPath.row]
        cell.configure(with: product)
        
        cell.decreaseQuantity = { [weak self] in
            // Implement decrease quantity logic if needed
        }
        
        cell.increaseQuantity = { [weak self] in
            // Implement increase quantity logic if needed
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let productId = viewModel.cartItems[indexPath.row].id
            viewModel.removeFromCart(productId: productId)
        }
    }
}
