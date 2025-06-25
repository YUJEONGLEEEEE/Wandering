//
//  WanderingApp.swift
//  Wandering
//
//  Created by 이유정 on 6/12/25.
//

import SwiftUI
import FirebaseCore


@main
struct WanderingApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
