//
//  loginViewController.swift
//  Hovalow
//
//  Created by NEW on 09/02/2025.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    // MARK: - UI Components
       private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Login"
           label.font = UIFont.boldSystemFont(ofSize: 28)
           label.textAlignment = .center
           return label
       }()

       private let mobileNumberLabel: UILabel = {
           let label = UILabel()
           label.text = "Enter your mobile number"
           label.font = UIFont.systemFont(ofSize: 16)
           label.textColor = UIColor.darkGray
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
           textField.placeholder = "1712345678"
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

       private let passwordLabel: UILabel = {
           let label = UILabel()
           label.text = "Enter your password"
           label.font = UIFont.systemFont(ofSize: 16)
           label.textColor = UIColor.darkGray
           return label
       }()

       private let passwordTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "**********"
           textField.font = UIFont.systemFont(ofSize: 16)
           textField.isSecureTextEntry = true
           textField.layer.borderWidth = 1
           textField.layer.borderColor = UIColor.lightGray.cgColor
           textField.layer.cornerRadius = 10
           textField.setLeftPaddingPoints(10)
           return textField
       }()

       private let forgotPasswordButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("forgot password?", for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           button.setTitleColor(.black, for: .normal)
           button.contentHorizontalAlignment = .right
           // Add target to the button
           button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside) // Add target here
      
           return button
       }()
    // Button action
    @objc private func forgotPasswordButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        guard let forgotPasswordVC = storyboard.instantiateViewController(withIdentifier: "forgotPassword") as? ForgotPasswordViewController else {
            print("Could not find ForgotPasswordViewController with identifier 'forgotPassword'")
            return
        }
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
       private let loginButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Login", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           button.backgroundColor = UIColor.brown
           button.layer.cornerRadius = 12
           button.setTitleColor(.white, for: .normal)
           return button
       }()

       private let signUpLabel: UILabel = {
           let label = UILabel()
           label.text = "Don’t have an account?"
           label.font = UIFont.systemFont(ofSize: 14)
           label.textColor = .darkGray
           label.textAlignment = .center
           return label
       }()

       private let signUpButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Sign Up", for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
           button.setTitleColor(.black, for: .normal)
           return button
       }()

       private let orLabel: UILabel = {
           let label = UILabel()
           label.text = "or"
           label.font = UIFont.systemFont(ofSize: 14)
           label.textAlignment = .center
           label.textColor = .gray
           return label
       }()

       private let googleButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle(" Continue with Google", for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
           button.setImage(UIImage(named: "Google")?.withRenderingMode(.alwaysOriginal), for: .normal)
           button.setTitleColor(.black, for: .normal)
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.lightGray.cgColor
           button.layer.cornerRadius = 10
           button.contentHorizontalAlignment = .center
           button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
           return button
       }()

       private let appleButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle(" Continue with Apple", for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
           button.setTitleColor(.black, for: .normal)
           button.setImage(UIImage(named: "Apple logo")?.withRenderingMode(.alwaysOriginal), for: .normal)
   
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.lightGray.cgColor
           button.layer.cornerRadius = 10
           button.contentHorizontalAlignment = .center
           button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
           return button
       }()

       private let guestButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Continue as Guest", for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           button.setTitleColor(.black, for: .normal)
           button.titleLabel?.textAlignment = .center
           return button
       }()

       // MARK: - View Lifecycle
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           setupLayout()
       }

       // MARK: - Layout Setup
       private func setupLayout() {
           let stackView = UIStackView(arrangedSubviews: [
               titleLabel,
               mobileNumberLabel, createMobileNumberStack(),
               passwordLabel, createPasswordStack(),
               forgotPasswordButton,
               loginButton,
               createSignUpStack(),
               orLabel,
               googleButton,
               appleButton,
               guestButton
           ])

           stackView.axis = .vertical
           stackView.spacing = 18
           stackView.translatesAutoresizingMaskIntoConstraints = false

           view.addSubview(stackView)

           NSLayoutConstraint.activate([
               stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               loginButton.heightAnchor.constraint(equalToConstant: 55),
               googleButton.heightAnchor.constraint(equalToConstant: 50),
               appleButton.heightAnchor.constraint(equalToConstant: 50)
           ])
       }

       private func createMobileNumberStack() -> UIStackView {
           let stackView = UIStackView(arrangedSubviews: [countryCodeTextField, mobileNumberTextField, mobileNumberCheckmark])
               stackView.axis = .horizontal
               stackView.spacing = 8
               stackView.alignment = .center // Ensures all views are vertically centered
               stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

               countryCodeTextField.widthAnchor.constraint(equalToConstant: 70).isActive = true
           countryCodeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
               mobileNumberCheckmark.widthAnchor.constraint(equalToConstant: 20).isActive = true
               mobileNumberCheckmark.heightAnchor.constraint(equalToConstant: 20).isActive = true
               mobileNumberCheckmark.translatesAutoresizingMaskIntoConstraints = false // Ensures constraints take precedence

               mobileNumberTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

               return stackView
       }

       private func createPasswordStack() -> UIStackView {
           let stackView = UIStackView(arrangedSubviews: [passwordTextField])
           passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           return stackView
       }

       private func createSignUpStack() -> UIStackView {
           let stackView = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
           stackView.axis = .horizontal
           stackView.alignment = .center
           stackView.spacing = 5
           stackView.distribution = .equalSpacing
           stackView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
       
           return stackView
       }
   }

   private extension UITextField {
       func setLeftPaddingPoints(_ amount:CGFloat){
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
           self.leftView = paddingView
           self.leftViewMode = .always
       }
}
