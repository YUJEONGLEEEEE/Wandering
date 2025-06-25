//
//  LoginView.swift
//  Wandering
//
//  Created by 이유정 on 6/16/25.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible = false


    var body: some View {
        VStack(spacing: 30) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Google")

            Button("close") {

            }

        }
        .padding()
    }
}

#Preview {
    LoginView()
}
