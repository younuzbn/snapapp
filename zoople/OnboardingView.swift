//
//  OnboardingView.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct OnboardView: View {
   
   
    var body: some View {
        VStack(spacing: 20) {
//            Image(systemName: systemImageName)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.teal)
//            
//            Text(title)
//                .font(.title).bold()
//            
//            Text(description)
//                .multilineTextAlignment(.center)
//                .foregroundColor(.secondary)
//                        Spacer()
                        Text("Add Profile Photo")
                            .foregroundStyle(.textClr)
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                        Image("pro_pic")
                            .resizable()
                            .frame(width: 280, height: 280)
                        Text("Name of User")
                            .foregroundStyle(.textClr)
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                        Spacer()
           
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}


#Preview {
    LoginScreen()
}
