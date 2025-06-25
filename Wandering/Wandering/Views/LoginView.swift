//
//  LoginView.swift
//  Wandering
//
//  Created by 이유정 on 6/16/25.
//

import SwiftUI
import FirebaseAuth
import GoogleSignInSwift

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible = false
    @State private var showingForgotPassword = false
    @State private var showingAlert = false
    @State private var alertMessage = ""


    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                // Title
                Text("LOGIN")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)

                // Email
                TextField("Email", text: $email)
                    .padding(.horizontal, 16)
                    .frame(height: 48)
                    .background(.white)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1))
                    .foregroundStyle(.black)
                    .font(.system(size: 17))
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                // Password
                HStack {
                    Group {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .foregroundStyle(.black)
                .font(.system(size: 17))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(.white)
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(Color.black, lineWidth: 1))

            // Log in Button
            Button(action: {
                alertMessage = "Login tapped with email: \(email), password: \(password)"
                showingAlert = true
            }) {
                Text("Log in")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(.black)
                    .cornerRadius(6)
            }
            .disabled(email.isEmpty || password.isEmpty)
            .padding(.top, 4)

            // Sign up prompt
            HStack(spacing: 2) {
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                    .font(.system(size: 15))
                Button(action: {}) {
                    Text("Create one →")
                        .foregroundStyle(.black)
                        .font(.system(size: 15, weight: .bold))
                }
            }
            .padding(.top, 2)

            // Divider
            HStack {
                Rectangle()
                    .fill(.black)
                    .frame(height: 1)
                    .opacity(0.2)
                Text("Or")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 12)
                Rectangle()
                    .fill(.black)
                    .frame(height: 1)
                    .opacity(0.2)
            }
            .padding(.vertical, 8)

            // Google sign-in Button (UI only, no functionality yet)
            Button(action: {
                alertMessage = "Google sign-in not implemented yet"
                showingAlert = true
            }) {
                HStack {
                    Image("google")
                        .resizable()
                        .frame(width: 22, height: 22)
                    Text("Continue with Google")
                        .foregroundStyle(.black)
                        .font(.system(size: 17, weight: .medium))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1)
                )
                .background(.white)
            }
                
        Spacer()
    }
        .padding(.horizontal, 28)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Info"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
}

    }

            }
        }

#Preview {
    LoginView()
}
