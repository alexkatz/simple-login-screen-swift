//
//  UIViewExtensions.swift
//  LoginScreenDemo
//
//  Created by Alexander Katz on 3/14/17.
//  Copyright © 2017 AlexKatz. All rights reserved.
//

import UIKit

extension UIView {
  
  func addView(_ view: UIView, andEdgeInsets insets: UIEdgeInsets? = nil) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets?.left ?? 0).isActive = true
    view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: insets?.right ?? 0).isActive = true
    view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets?.top ?? 0).isActive = true
    view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets?.bottom ?? 0).isActive = true
  }
  
  func addViewToCenter(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  
}
