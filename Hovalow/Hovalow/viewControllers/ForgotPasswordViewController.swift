//
//  ForgotPasswordViewController.swift
//  Hovalow
//
//  Created by NEW on 09/02/2025.
//

import Foundation
import UIKit

    
    class ForgotPasswordViewController: UIViewController {
        // MARK: - UI Components
          private let backButton: UIButton = {
              let button = UIButton(type: .system)
              button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
              button.tintColor = .black
              button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside) // Add target for back button
              return button
          }()

          private let titleLabel: UILabel = {
              let label = UILabel()
              label.text = "Forgot"
              label.font = UIFont.boldSystemFont(ofSize: 25)
              label.textAlignment = .left
              label.textColor = .black
              return label
          }()
        private let topSubtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Forgot Password?"
            label.font = UIFont.boldSystemFont(ofSize: 28)
            label.textAlignment = .left
            
            label.textColor = .black
            return label
        }()

          private let forgotPasswordImage: UIImageView = {
              let imageView = UIImageView()
              imageView.image = UIImage(named: "forgot password")
              imageView.contentMode = .scaleAspectFit
              return imageView
          }()

          private let subtitleLabel: UILabel = {
              let label = UILabel()
              label.text = "Don’t worry! It happens. Please enter phone number associated with your account"
              label.font = UIFont.systemFont(ofSize: 16)
              label.textColor = .darkGray
              label.textAlignment = .center
              label.numberOfLines = 0
              return label
          }()

          private let mobileNumberLabel: UILabel = {
              let label = UILabel()
              label.text = "Enter your mobile number"
              label.font = UIFont.systemFont(ofSize: 16)
              label.textColor = .black
              label.textAlignment = .left
              return label
          }()

          private let countryCodeTextField: UITextField = {
              let textField = UITextField()
              textField.text = "+91"
              textField.font = UIFont.systemFont(ofSize: 16)
              textField.textAlignment = .center
              textField.layer.borderWidth = 1
              textField.layer.borderColor = UIColor.lightGray.cgColor
              textField.layer.cornerRadius = 10
              textField.isEnabled = false
              
              let chevronContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
              let chevronView = UIImageView(image: UIImage(systemName: "chevron.down"))
              chevronView.tintColor = .gray
              chevronView.contentMode = .scaleAspectFit
              chevronView.frame = CGRect(x: 5, y: 0, width: 20, height: 30)
              chevronContainerView.addSubview(chevronView)
              
              textField.rightView = chevronContainerView
              textField.rightViewMode = .always
              
              return textField
          }()

          private let mobileNumberTextField: UITextField = {
              let textField = UITextField()
              textField.placeholder = "458-465-6466"
              textField.font = UIFont.systemFont(ofSize: 16)
              textField.keyboardType = .numberPad
              textField.layer.borderWidth = 1
              textField.layer.borderColor = UIColor.lightGray.cgColor
              textField.layer.cornerRadius = 10
              textField.setLeftPaddingPoints(10)
              return textField
          }()

          private let mobileNumberCheckmark: UIImageView = {
              let imageView = UIImageView()
              imageView.image = UIImage(systemName: "checkmark.circle.fill")
              imageView.tintColor = .black
              return imageView
          }()

          private let getOtpButton: UIButton = {
              let button = UIButton(type: .system)
              button.setTitle("Get OTP", for: .normal)
              button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
              button.backgroundColor = UIColor.brown
              button.layer.cornerRadius = 12
              button.setTitleColor(.white, for: .normal)
              button.addTarget(self, action: #selector(getOtpButtonTapped), for: .touchUpInside) // Add target
              return button
          }()
        @objc private func getOtpButtonTapped() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Change "Main" if your storyboard has a different name
            if let otpVC = storyboard.instantiateViewController(withIdentifier: "otpView") as? OTPViewController {
                navigationController?.pushViewController(otpVC, animated: true) // Push if using navigation
                // present(otpVC, animated: true, completion: nil) // Use this if you want to present modally
            }
        }


          // MARK: - View Lifecycle
          override func viewDidLoad() {
              super.viewDidLoad()
              view.backgroundColor = .white
              setupLayout()
              self.navigationItem.hidesBackButton = true
          }

          // MARK: - Layout Setup
          private func setupLayout() {
              view.addSubview(backButton)
              view.addSubview(titleLabel)
              view.addSubview(forgotPasswordImage)
              view.addSubview(topSubtitleLabel)
              view.addSubview(subtitleLabel)
              view.addSubview(mobileNumberLabel)
              view.addSubview(createMobileNumberStack())
              view.addSubview(getOtpButton)

              backButton.translatesAutoresizingMaskIntoConstraints = false
              titleLabel.translatesAutoresizingMaskIntoConstraints = false
              forgotPasswordImage.translatesAutoresizingMaskIntoConstraints = false
              topSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
              subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
              mobileNumberLabel.translatesAutoresizingMaskIntoConstraints = false
              getOtpButton.translatesAutoresizingMaskIntoConstraints = false

              NSLayoutConstraint.activate([
                  backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                  backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                  backButton.widthAnchor.constraint(equalToConstant: 30),
                  backButton.heightAnchor.constraint(equalToConstant: 30),

                  titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
                  titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),

                  forgotPasswordImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  forgotPasswordImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
                  forgotPasswordImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                  forgotPasswordImage.heightAnchor.constraint(equalTo: forgotPasswordImage.widthAnchor),
                  
                 topSubtitleLabel.topAnchor.constraint(equalTo: forgotPasswordImage.bottomAnchor, constant: 30),
             topSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                  subtitleLabel.topAnchor.constraint(equalTo:topSubtitleLabel.bottomAnchor, constant: 20),
                  subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                  subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                  mobileNumberLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
                  mobileNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

                  getOtpButton.topAnchor.constraint(equalTo: mobileNumberLabel.bottomAnchor, constant: 100),
                  getOtpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                  getOtpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                  getOtpButton.heightAnchor.constraint(equalToConstant: 55)
              ])
          }

          private func createMobileNumberStack() -> UIStackView {
              // Create the stack view
                 let stackView = UIStackView(arrangedSubviews: [countryCodeTextField, mobileNumberTextField, mobileNumberCheckmark])
                 stackView.axis = .horizontal
                 stackView.spacing = 8
                 stackView.alignment = .center // Keep subviews vertically centered
                 stackView.translatesAutoresizingMaskIntoConstraints = false
                 view.addSubview(stackView)

                 // Add constraints to subviews
                 NSLayoutConstraint.activate([
                     // Stack view height
                     stackView.heightAnchor.constraint(equalToConstant: 50),

                     // Country code text field
                     countryCodeTextField.widthAnchor.constraint(equalToConstant: 70),
                     countryCodeTextField.heightAnchor.constraint(equalTo: stackView.heightAnchor), // Match stack height

                     // Mobile number text field
                     mobileNumberTextField.heightAnchor.constraint(equalTo: stackView.heightAnchor), // Match stack height

                     // Mobile number checkmark (smaller height)
                     mobileNumberCheckmark.widthAnchor.constraint(equalToConstant: 20),
                     mobileNumberCheckmark.heightAnchor.constraint(equalToConstant: 20),

                     // Stack view constraints
                     stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                     stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                     stackView.topAnchor.constraint(equalTo: mobileNumberLabel.bottomAnchor, constant: 20)
                 ])

                 return stackView
          }

          // MARK: - Actions
          @objc private func backButtonTapped() {
              navigationController?.popViewController(animated: true)
          }
      }

      private extension UITextField {
          func setLeftPaddingPoints(_ amount: CGFloat) {
              let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
              self.leftView = paddingView
              self.leftViewMode = .always
          }
    }
    

