//
//  findYourHomeViewController.swift
//  Hovalow
//
//  Created by NEW on 22/02/2025.
//

import Foundation
import UIKit


class findYourHomeViewController: UIViewController {
    
    // MARK: - Properties
    private var currentPage: Int = 0 {
        didSet {
            updateUIForCurrentPage()
        }
    }
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your perfect home!"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter by furnishig, location, type and\nprice & reach the renter directly!"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "modern-house") // Replace with your image name
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let gradientOverlay: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.black.withAlphaComponent(0.0).cgColor,
            UIColor.black.withAlphaComponent(0.2).cgColor
        ]
        gradient.locations = [0.7, 1.0]
        return gradient
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientOverlay.frame = imageContainer.bounds
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        
        // Add subviews
        view.addSubview(containerView)
        containerView.addSubview(skipButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(pageControl)
        containerView.addSubview(imageContainer)
        
        imageContainer.addSubview(backgroundImageView)
        imageContainer.layer.addSublayer(gradientOverlay)
        containerView.addSubview(nextButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Container view
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Skip button
            skipButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            // Title label
            titleLabel.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            // Description label
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            // Page control
            pageControl.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            // Image container
            imageContainer.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 40),
            imageContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -4),
            imageContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 4),
            imageContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 4),
            
            // Background image
            backgroundImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            
            // Next button
            nextButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40),
            nextButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add button targets
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Actions
    @objc private func skipButtonTapped() {
        // Handle skip button tap
    }
    
    @objc private func nextButtonTapped() {
        if currentPage == 0 {
            currentPage = 1
        } else {
            // Handle "Get Started!" button tap (e.g., navigate to the next screen)
        }
    }
    
    // MARK: - Update UI
    private func updateUIForCurrentPage() {
        // Update page control
        pageControl.currentPage = currentPage
        
        // Update button title
        let buttonTitle = currentPage == 0 ? "Next" : "Get Started!"
        nextButton.setTitle(buttonTitle, for: .normal)
        
        // Update description and image with animation
        UIView.transition(with: descriptionLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.descriptionLabel.text = self.currentPage == 0 ?
                "Filter by furnishig, location, type and\nprice & reach the renter directly!" :
                "Get verified tenants of your property with an easy to manage dashboard!"
            self.titleLabel.text = self.currentPage == 0 ?
                "Find your perfect home!" :
                "List your property!"
        }, completion: nil)
        
        UIView.transition(with: backgroundImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.backgroundImageView.image = self.currentPage == 0 ?
                UIImage(named: "modern-house") : // Replace with your first image name
                UIImage(named: "listing") // Replace with your second image name
        }, completion: nil)
    }
}
