//
//  SelectAgeScreen.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 22/05/24.
//

import SwiftUI

struct SelectAgeScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Select your age group")
                .foregroundStyle(.textClr)
                .font(.system(size: 24, weight: .bold))
            
            
            Spacer()
            VStack {
                HStack {
                    Text("Below 13")
                        .frame(width: 130, height: 80)
                                .background(.light)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.all, 5)
                    Text("13-19")
                        .frame(width: 130, height: 80)
                                .background(.light)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.all, 5)
                }
                HStack {
                    Text("20-25")
                        .frame(width: 130, height: 80)
                                .background(.textClr)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.all, 5)
                    Text("36-60")
                        .frame(width: 130, height: 80)
                                .background(.light)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.all, 5)
                }
                HStack {
                    Text("Above 60")
                        .frame(width: 130, height: 80)
                                .background(.light)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.all, 5)
                }
            }
                
            
            
            
            
            Spacer()
           
               Spacer()
           
            
        }
    }
}

#Preview {
    SelectAgeScreen()
}
