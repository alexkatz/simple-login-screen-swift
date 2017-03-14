//
//  ViewController.swift
//  LoginScreenDemo
//
//  Created by Alexander Katz on 3/14/17.
//  Copyright © 2017 AlexKatz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  var containerView: UIView!
  var topView: UIView!
  var bottomView: UIView!
  var logoView: UILabel!
  
  var containerViewBottomConstraint: NSLayoutConstraint!
  
  var loginTextField: UITextField!
  var passwordTextField: UITextField!
  
  let textFieldHeight = CGFloat(66)
  let padding = CGFloat(16)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(containerView)
    containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    containerViewBottomConstraint.isActive = true
    
    createTopView()
    createBottomView()
    
//    topView.backgroundColor = UIColor.black.withAlphaComponent(0.04)
//    bottomView.backgroundColor = UIColor.black.withAlphaComponent(0.08)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  }
  
  func keyboardWillShow(_ notification: Notification) {
    guard let info = notification.userInfo else { return }
    guard let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
    guard let duration = info[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
    
    self.containerViewBottomConstraint.constant = -keyboardFrame.height
    
    UIView.animate(withDuration: duration) {
      self.view.layoutIfNeeded()
    }
    
  }
  
  func keyboardWillHide(_ notification: Notification) {
    guard let info = notification.userInfo else { return }
    guard let duration = info[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
    
    self.containerViewBottomConstraint.constant = 0
    
    UIView.animate(withDuration: duration) {
      self.view.layoutIfNeeded()
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.returnKeyType == .next {
      passwordTextField.becomeFirstResponder()
    } else {
      print("Logging in!")
    }
    
    return true
  }
  
  func dismissKeyboard() {
    loginTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
  }
  
  func createTopView() {
    topView = UIView()
    topView.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(topView)
    topView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
    topView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
    topView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    topView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
    
    logoView = UILabel()
    logoView.text = "Demo Login Screen"
    logoView.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightUltraLight)
    topView.addViewToCenter(view: logoView)
    topView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
  }
  
  func createBottomView() {
    bottomView = UIView()
    bottomView.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(bottomView)
    bottomView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
    bottomView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
    bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    
    loginTextField = UITextField()
    loginTextField.translatesAutoresizingMaskIntoConstraints = false
    bottomView.addSubview(loginTextField)
    loginTextField.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: padding).isActive = true
    loginTextField.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -padding).isActive = true
    loginTextField.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    loginTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
    loginTextField.placeholder = "Username"
    loginTextField.keyboardType = .emailAddress
    loginTextField.returnKeyType = .next
    loginTextField.autocorrectionType = .no
    loginTextField.autocapitalizationType = .none
    loginTextField.borderStyle = .roundedRect
    loginTextField.delegate = self
    
    passwordTextField = UITextField()
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    bottomView.addSubview(passwordTextField)
    passwordTextField.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: padding).isActive = true
    passwordTextField.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -padding).isActive = true
    passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: padding / 2).isActive = true
    passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
    passwordTextField.placeholder = "Password"
    passwordTextField.returnKeyType = .go
    passwordTextField.isSecureTextEntry = true
    passwordTextField.borderStyle = .roundedRect
    passwordTextField.delegate = self
    
    bottomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
  }
  
}

