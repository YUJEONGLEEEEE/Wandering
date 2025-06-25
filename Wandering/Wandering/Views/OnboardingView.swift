//
//  ContentView.swift
//  Wandering
//
//  Created by 이유정 on 6/12/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showLogin = false

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            Text("Welcome to\nWandering")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("Find interesting places\nnear you")
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                showLogin = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
//    #Preview {
//        NavigationStack{
//            OnboardingView()
//        }
//    }
}
