//
//  CompletionScreen.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct CompletionScreen: View {
    @State private var isSuccess = false
    var body: some View {
        NavigationStack{
            Spacer()
            Spacer()
            Text("""
             Your Account
             has been created
             """)
            .foregroundStyle(.textClr)
            .font(.system(size: 24, weight: .bold))
            .multilineTextAlignment(.center)
            Spacer()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isSuccess = true
                    }
                }
                .navigationDestination(isPresented: $isSuccess) {
                    LandingPage()
                }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CompletionScreen()
}
