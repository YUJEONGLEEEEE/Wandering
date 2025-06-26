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
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 16) {
                Spacer()

                VStack(spacing: 0) {
                    Text("Welcome to")
                        .font(.system(size: 32, weight: .regular))
                        .foregroundStyle(.black)

                    Text("Wandering")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.black)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)

                Text("Find interesting places near you")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)

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
    }
}
#Preview {
    NavigationStack{
        OnboardingView()
    }
}
