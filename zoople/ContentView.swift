//
//  ContentView.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 21/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginScreen = false

    var body: some View {
        Group {
            if showLoginScreen {
                LoginScreen()
            } else {
                ZStack {
                    Image("bg")
                        .resizable()
                        .ignoresSafeArea()
                    VStack {
                        Image("launch_Icon")
                    }
                }
                .background(Color.purple)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showLoginScreen = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
