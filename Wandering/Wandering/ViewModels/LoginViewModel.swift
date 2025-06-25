//
//  LoginViewModel.swift
//  Wandering
//
//  Created by 이유정 on 6/16/25.
//

import Foundation
import FirebaseAuth


@MainActor
class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage  = ""
    @Published var isAuthenticated = false


    // Login: Using Email and Password
    func signInWithEmail(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            showErrorMessage("Please fill in all fields")
            return
        }

        isLoading = true


        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                print("User signed in: \(result.user.email ?? "")")
                isAuthenticated = true
                isLoading = true
            } catch {
                showErrorMessage(error.localizedDescription)
                isLoading = false
            }
        }
    }



// Logout
func signOut() {
       do {
           try Auth.auth().signOut()
           isAuthenticated = false
       } catch {
           showErrorMessage(error.localizedDescription)
       }
   }

private func showErrorMessage(_ message: String) {
    errorMessage = message
    showError = true
}
