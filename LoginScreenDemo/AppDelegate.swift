//
//  AppDelegate.swift
//  LoginScreenDemo
//
//  Created by Alexander Katz on 3/14/17.
//  Copyright © 2017 AlexKatz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = LoginViewController()
    window?.makeKeyAndVisible()
    
    return true
  }

}

