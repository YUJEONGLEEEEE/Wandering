//
//  AppDelegate.swift
//  Wandering
//
//  Created by 이유정 on 6/16/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey:  Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }

}
