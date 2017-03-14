//
//  UIViewExtensions.swift
//  LoginScreenDemo
//
//  Created by Alexander Katz on 3/14/17.
//  Copyright © 2017 AlexKatz. All rights reserved.
//

import UIKit

extension UIView {

  func addViewToCenter(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  
}
