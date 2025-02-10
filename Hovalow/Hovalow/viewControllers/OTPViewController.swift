//
//  OTPViewController.swift
//  Hovalow
//
//  Created by NEW on 10/02/2025.
//

import Foundation
import UIKit
class OTPViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Verify"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let otpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "otp image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let enterOtpLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter OTP"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let otpSentLabel: UILabel = {
        let label = UILabel()
        label.text = "A 4 digit OTP has been sent to"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let otpNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "458-465-6466"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private var otpFields: [UITextField] = []
    private let otpStackView = UIStackView()
    
    private let verifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Verify", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.brown
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(verifyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resendOtpLabel: UILabel = {
        let label = UILabel()
        label.text = "Resend OTP (00:12)"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(otpImageView)
        view.addSubview(enterOtpLabel)
        view.addSubview(otpSentLabel)
        view.addSubview(otpNumberLabel)
        view.addSubview(verifyButton)
        view.addSubview(resendOtpLabel)
        view.addSubview(otpStackView)
        
        setupOtpFields()
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        otpImageView.translatesAutoresizingMaskIntoConstraints = false
        enterOtpLabel.translatesAutoresizingMaskIntoConstraints = false
        otpSentLabel.translatesAutoresizingMaskIntoConstraints = false
        otpNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
        verifyButton.translatesAutoresizingMaskIntoConstraints = false
        resendOtpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            otpImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            otpImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otpImageView.widthAnchor.constraint(equalToConstant: 300),
            otpImageView.heightAnchor.constraint(equalToConstant: 200),
            
            enterOtpLabel.topAnchor.constraint(equalTo: otpImageView.bottomAnchor, constant: 20),
            enterOtpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            otpSentLabel.topAnchor.constraint(equalTo: enterOtpLabel.bottomAnchor, constant: 10),
            otpSentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            otpNumberLabel.topAnchor.constraint(equalTo: otpSentLabel.bottomAnchor, constant: 5),
            otpNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            otpStackView.topAnchor.constraint(equalTo: otpNumberLabel.bottomAnchor, constant: 20),
            otpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otpStackView.widthAnchor.constraint(equalToConstant: 280),
            
            verifyButton.topAnchor.constraint(equalTo: otpStackView.bottomAnchor, constant: 30),
            verifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verifyButton.widthAnchor.constraint(equalToConstant: 200),
            verifyButton.heightAnchor.constraint(equalToConstant: 50),
            
            resendOtpLabel.topAnchor.constraint(equalTo: verifyButton.bottomAnchor, constant: 15),
            resendOtpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupOtpFields() {
        otpStackView.axis = .horizontal
        otpStackView.spacing = 15
        otpStackView.distribution = .fillEqually
        
        for i in 0..<4 {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.textAlignment = .center
            textField.font = UIFont.boldSystemFont(ofSize: 24)
            textField.keyboardType = .numberPad
            textField.delegate = self
            textField.tag = i
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            otpFields.append(textField)
            otpStackView.addArrangedSubview(textField)
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Handle deletion
        if string.isEmpty {
            // If the user is deleting and the text field is already empty, move to the previous field
            if textField.text?.isEmpty == true {
                moveToPreviousField(textField)
            }
            return true
        }
        
        // Handle input
        if let text = textField.text, text.count == 1 {
            // If the text field already has a character, don't allow more input
            return false
        }
        
        return true
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count == 1 {
            textField.text = String(text.prefix(1))
            moveToNextField(textField)
        }
    }
    
    private func moveToNextField(_ textField: UITextField) {
        if let index = otpFields.firstIndex(of: textField), index < otpFields.count - 1 {
            otpFields[index + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    private func moveToPreviousField(_ textField: UITextField) {
        if let index = otpFields.firstIndex(of: textField), index > 0 {
            otpFields[index - 1].becomeFirstResponder()
        }
    }
    
    @objc private func verifyButtonTapped() {
        print("OTP Submitted: \(otpFields.map { $0.text ?? "" }.joined())")
    }
}
