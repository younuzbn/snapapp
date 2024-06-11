//
//  OnboardingView.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct OnboardView: View {
   
   @State private var pickerIsPresented = false
    @State private var image = UIImage()
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
            Button {
                pickerIsPresented.toggle()
            } label: {
                
                
                
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 280, height: 280)
            }
            .sheet(isPresented: $pickerIsPresented) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
            }
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
