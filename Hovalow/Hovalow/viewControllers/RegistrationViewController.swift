//
//  RegistrationViewController.swift
//  Hovalow
//
//  Created by NEW on 20/02/2025.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    private let mobileTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "1712345678"
        field.layer.cornerRadius = 10
        field.font = .systemFont(ofSize: 16)
        field.keyboardType = .numberPad
        field.addDoneButtonToKeyboard()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    private let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "abc12@gmail.com"
        field.font = .systemFont(ofSize: 16)
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.backgroundColor = .clear
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        field.leftViewMode = .always
        field.addDoneButtonToKeyboard()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.font = .systemFont(ofSize: 16)
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.backgroundColor = .clear
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        field.leftViewMode = .always
        field.placeholder = "•••••••••"
        field.addDoneButtonToKeyboard()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    private let reenterPasswordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.font = .systemFont(ofSize: 16)
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.backgroundColor = .clear
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        field.leftViewMode = .always
        field.placeholder = "•••••••••"
        field.addDoneButtonToKeyboard()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mobileLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your mobile number"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mobileContainer: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countryCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("+91", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    private let checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your password"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let reenterPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Re-enter your password"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(red: 0.51, green: 0.31, blue: 0.13, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.setImage(UIImage(named: "Google"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Continue with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.setImage(UIImage(named: "Apple logo"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        [titleLabel, mobileLabel, mobileContainer, emailLabel, emailTextField,
         passwordLabel, passwordTextField, reenterPasswordLabel, reenterPasswordTextField,
         signUpButton, accountLabel, signInButton, orLabel, googleButton, appleButton].forEach { view.addSubview($0) }
        
        mobileContainer.addSubview(countryCodeButton)
        mobileContainer.addSubview(mobileTextField)
        mobileContainer.addSubview(checkmarkButton)
        
        setupPasswordFields()
        setupConstraints()
    }
    
    // Update the setupPasswordFields() function in the RegistrationViewController:

    private func setupPasswordFields() {
        // Create right view containers with proper width for padding
        let passwordRightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        let reenterRightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        
        // Add eye buttons to right views
        passwordRightView.addSubview(passwordEyeButton)
        reenterRightView.addSubview(reenterEyeButton)
        
        // Set right views to text fields
        passwordTextField.rightView = passwordRightView
        passwordRightView.isUserInteractionEnabled = true
      
        reenterRightView.isUserInteractionEnabled = true
        passwordTextField.isUserInteractionEnabled = true
        reenterPasswordTextField.isUserInteractionEnabled = true
        passwordTextField.rightViewMode = .always
        reenterPasswordTextField.rightView = reenterRightView
        reenterPasswordTextField.rightViewMode = .always
        passwordRightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        reenterRightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        // Position eye buttons within their container views
        NSLayoutConstraint.activate([
            passwordEyeButton.trailingAnchor.constraint(equalTo: passwordRightView.trailingAnchor, constant: -15),
            passwordEyeButton.centerYAnchor.constraint(equalTo: passwordRightView.centerYAnchor),
            passwordEyeButton.widthAnchor.constraint(equalToConstant: 22),
            passwordEyeButton.heightAnchor.constraint(equalToConstant: 22),
            
            reenterEyeButton.trailingAnchor.constraint(equalTo: reenterRightView.trailingAnchor, constant: -15),
            reenterEyeButton.centerYAnchor.constraint(equalTo: reenterRightView.centerYAnchor),
            reenterEyeButton.widthAnchor.constraint(equalToConstant: 22),
            reenterEyeButton.heightAnchor.constraint(equalToConstant: 22),
            
        ])
    }
    @objc func signInButtonTapped() {
        // Implement your sign in button tap logic here
        navigationController?.popViewController(animated: true)
       }

    
    // Also update the eye buttons' initialization to use the correct color:

    private let passwordEyeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(passwordEyeButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .systemGray4 // Lighter gray color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let reenterEyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.addTarget(self, action: #selector(reenterEyeButtonTapped), for: .touchUpInside)
        button.tintColor = .systemGray4 // Lighter gray color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func passwordEyeButtonTapped() {
        passwordEyeButton.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }

    @objc func reenterEyeButtonTapped() {
        reenterEyeButton.isSelected.toggle()
        reenterPasswordTextField.isSecureTextEntry.toggle()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mobileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            mobileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mobileContainer.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor, constant: 10),
            mobileContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mobileContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mobileContainer.heightAnchor.constraint(equalToConstant: 50),
            
            countryCodeButton.leadingAnchor.constraint(equalTo: mobileContainer.leadingAnchor, constant: 15),
            countryCodeButton.centerYAnchor.constraint(equalTo: mobileContainer.centerYAnchor),
            
            mobileTextField.leadingAnchor.constraint(equalTo: countryCodeButton.trailingAnchor, constant: 10),
            mobileTextField.centerYAnchor.constraint(equalTo: mobileContainer.centerYAnchor),
            
            checkmarkButton.trailingAnchor.constraint(equalTo: mobileContainer.trailingAnchor, constant: -15),
            checkmarkButton.centerYAnchor.constraint(equalTo: mobileContainer.centerYAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: mobileContainer.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            reenterPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            reenterPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            reenterPasswordTextField.topAnchor.constraint(equalTo: reenterPasswordLabel.bottomAnchor, constant: 10),
            reenterPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reenterPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reenterPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: reenterPasswordTextField.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            accountLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
                    accountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
                    
                    signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
                    signInButton.leadingAnchor.constraint(equalTo: accountLabel.trailingAnchor, constant: 5),
            signInButton.heightAnchor.constraint(equalToConstant: 19),
            
            orLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            googleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            appleButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 15),
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            appleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension UITextField {
    func addDoneButtonToKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        doneToolbar.items = [flexSpace, doneButton]
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
