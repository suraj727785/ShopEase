//
//  ProductDetailViewController.swift
//  ShopEase
//
//  Created by Suraj Kumar on 11/04/25.
//
import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: ProductViewModel
    private let mainViewModel: MainViewModel
    private var isFavorite: Bool
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .systemPink
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let percentageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "hand.thumbsup.fill")
        imageView.tintColor = UIColor.systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewsCountContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let reviewsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let reviewsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monthlyPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let readMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Read more", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to cart", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.2, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let deliveryInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializer
    init(viewModel: ProductViewModel, mainViewModel: MainViewModel) {
        self.viewModel = viewModel
        self.mainViewModel = mainViewModel
        self.isFavorite = mainViewModel.isFavorite(productId: viewModel.id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureWithViewModel()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(productImageView)
        contentView.addSubview(backButton)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(pageControl)
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(ratingContainer)
        ratingContainer.addSubview(starIconView)
        ratingContainer.addSubview(ratingLabel)
        ratingContainer.addSubview(reviewsLabel)
        
        contentView.addSubview(percentageContainer)
        percentageContainer.addSubview(percentageIcon)
        percentageContainer.addSubview(percentageLabel)
        
        contentView.addSubview(reviewsCountContainer)
        reviewsCountContainer.addSubview(reviewsIcon)
        reviewsCountContainer.addSubview(reviewsCountLabel)
        
        contentView.addSubview(priceContainer)
        priceContainer.addSubview(priceLabel)
        priceContainer.addSubview(monthlyPriceLabel)
        priceContainer.addSubview(infoButton)
        
        contentView.addSubview(descriptionTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(readMoreButton)
        
        contentView.addSubview(addToCartButton)
        contentView.addSubview(deliveryInfoLabel)
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        // Scroll view constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Content view constraints
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Image view constraints
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        // Button constraints
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            favoriteButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -12),
            favoriteButton.widthAnchor.constraint(equalToConstant: 40),
            favoriteButton.heightAnchor.constraint(equalToConstant: 40),
            
            shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 40),
            shareButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Page control constraints
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            pageControl.widthAnchor.constraint(equalToConstant: 100),
            pageControl.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Title constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        // Rating container constraints
        NSLayoutConstraint.activate([
            ratingContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            ratingContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ratingContainer.heightAnchor.constraint(equalToConstant: 24),
            
            starIconView.leadingAnchor.constraint(equalTo: ratingContainer.leadingAnchor),
            starIconView.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
            starIconView.widthAnchor.constraint(equalToConstant: 16),
            starIconView.heightAnchor.constraint(equalToConstant: 16),
            
            ratingLabel.leadingAnchor.constraint(equalTo: starIconView.trailingAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
            
            reviewsLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 4),
            reviewsLabel.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
            reviewsLabel.trailingAnchor.constraint(equalTo: ratingContainer.trailingAnchor)
        ])
        
        // Percentage container constraints
        NSLayoutConstraint.activate([
            percentageContainer.topAnchor.constraint(equalTo: ratingContainer.bottomAnchor, constant: 12),
            percentageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            percentageContainer.heightAnchor.constraint(equalToConstant: 32),
            
            percentageIcon.leadingAnchor.constraint(equalTo: percentageContainer.leadingAnchor, constant: 8),
            percentageIcon.centerYAnchor.constraint(equalTo: percentageContainer.centerYAnchor),
            percentageIcon.widthAnchor.constraint(equalToConstant: 16),
            percentageIcon.heightAnchor.constraint(equalToConstant: 16),
            
            percentageLabel.leadingAnchor.constraint(equalTo: percentageIcon.trailingAnchor, constant: 4),
            percentageLabel.centerYAnchor.constraint(equalTo: percentageContainer.centerYAnchor),
            percentageLabel.trailingAnchor.constraint(equalTo: percentageContainer.trailingAnchor, constant: -8)
        ])
        
        // Reviews count container constraints
        NSLayoutConstraint.activate([
            reviewsCountContainer.topAnchor.constraint(equalTo: ratingContainer.bottomAnchor, constant: 12),
            reviewsCountContainer.leadingAnchor.constraint(equalTo: percentageContainer.trailingAnchor, constant: 12),
            reviewsCountContainer.heightAnchor.constraint(equalToConstant: 32),
            
            reviewsIcon.leadingAnchor.constraint(equalTo: reviewsCountContainer.leadingAnchor, constant: 8),
            reviewsIcon.centerYAnchor.constraint(equalTo: reviewsCountContainer.centerYAnchor),
            reviewsIcon.widthAnchor.constraint(equalToConstant: 16),
            reviewsIcon.heightAnchor.constraint(equalToConstant: 16),
            
            reviewsCountLabel.leadingAnchor.constraint(equalTo: reviewsIcon.trailingAnchor, constant: 4),
            reviewsCountLabel.centerYAnchor.constraint(equalTo: reviewsCountContainer.centerYAnchor),
            reviewsCountLabel.trailingAnchor.constraint(equalTo: reviewsCountContainer.trailingAnchor, constant: -8)
        ])
        
        // Price container constraints
        NSLayoutConstraint.activate([
            priceContainer.topAnchor.constraint(equalTo: percentageContainer.bottomAnchor, constant: 24),
            priceContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: priceContainer.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceContainer.leadingAnchor),
            
            monthlyPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            monthlyPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: -4),
            
            infoButton.centerYAnchor.constraint(equalTo: monthlyPriceLabel.centerYAnchor),
            infoButton.leadingAnchor.constraint(equalTo: monthlyPriceLabel.trailingAnchor, constant: 4),
            infoButton.widthAnchor.constraint(equalToConstant: 16),
            infoButton.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTitleLabel.topAnchor.constraint(equalTo: priceContainer.bottomAnchor, constant: 24),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            readMoreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        // Add to cart button constraints
        NSLayoutConstraint.activate([
            addToCartButton.topAnchor.constraint(equalTo: readMoreButton.bottomAnchor, constant: 20),
            addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50),
            
            deliveryInfoLabel.topAnchor.constraint(equalTo: addToCartButton.bottomAnchor, constant: 8),
            deliveryInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deliveryInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            deliveryInfoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        readMoreButton.addTarget(self, action: #selector(readMoreButtonTapped), for: .touchUpInside)
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
    }
    
    private func configureWithViewModel() {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        descriptionLabel.text = viewModel.description
        ratingLabel.text = viewModel.ratingText
        reviewsLabel.text = viewModel.ratingCount
        percentageLabel.text = viewModel.ratingPercentage
        reviewsCountLabel.text = "\(Int(Double(viewModel.ratingCount.components(separatedBy: " ")[0]) ?? 0))"
        
        
        let priceString = viewModel.price.replacingOccurrences(of: "$", with: "")
        if let price = Double(priceString) {
            let monthlyPrice = price / 12
            monthlyPriceLabel.text = "from $\(String(format: "%.2f", monthlyPrice)) per month"
        }
        
        let currentDate = Date()
        let calendar = Calendar.current
        if let deliveryDate = calendar.date(byAdding: .day, value: 7, to: currentDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM"
            let dateString = dateFormatter.string(from: deliveryDate)
            deliveryInfoLabel.text = "Delivery on \(dateString)"
        }
        
        if let imageURL = viewModel.imageURL {
            productImageView.loadImage(from: imageURL.absoluteString)
        }
        
        updateFavoriteButton()
    }
    
    private func updateFavoriteButton() {
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Action Methods
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func favoriteButtonTapped() {
        mainViewModel.toggleFavorite(productId: viewModel.id)
        isFavorite.toggle()
        updateFavoriteButton()
    }
    
    @objc private func shareButtonTapped() {
        let text = "Check out this product: \(viewModel.title) - \(viewModel.price)"
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    @objc private func readMoreButtonTapped() {
        if descriptionLabel.numberOfLines == 0 {
            descriptionLabel.numberOfLines = 3
            readMoreButton.setTitle("Read more", for: .normal)
        } else {
            descriptionLabel.numberOfLines = 0
            readMoreButton.setTitle("Read less", for: .normal)
        }
    }
    
    @objc private func addToCartButtonTapped() {
        mainViewModel.addToCart(product: viewModel)
        
        // Show success message
        let successLabel = UILabel()
        successLabel.text = "Added to cart"
        successLabel.textAlignment = .center
        successLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        successLabel.textColor = .white
        successLabel.layer.cornerRadius = 20
        successLabel.clipsToBounds = true
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(successLabel)
        
        NSLayoutConstraint.activate([
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            successLabel.widthAnchor.constraint(equalToConstant: 160),
            successLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        UIView.animate(withDuration: 0.3, animations: {
            successLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 1.5, options: [], animations: {
                successLabel.alpha = 0
            }) { _ in
                successLabel.removeFromSuperview()
            }
        }
    }
}
