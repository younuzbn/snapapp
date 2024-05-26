//
//  CompletionScreen.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct CompletionScreen: View {
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
                
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CompletionScreen()
}
