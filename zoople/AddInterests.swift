//
//  AddInterests.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct AddInterests: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Finally add your Interests")
                .foregroundStyle(.textClr)
                .font(.system(size: 24, weight: .bold))
            
            
            Spacer()
            VStack {
                HStack {
                    Text("re")
                        .padding()
                        .frame(height:50)
//                        .frame(maxWidth: .infinity)
                        .background(Color.light)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size: 17))
                    
                    
                    Text("Fashion")
                        .frame(height:50)
//                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.light)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size: 17))
                    
                    Text("Photojournal")
                        .frame(height:50)
//                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.light)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size: 17))
                    
                }
                .padding(.horizontal, 20)
                
                
                
            }
                
            
            
            
            
            Spacer()
          
               Spacer()
            
            
        }

    }
}

#Preview {
    AddInterests()
}
