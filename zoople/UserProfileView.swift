//
//  UserProfileView.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 27/05/24.
//

import SwiftUI

struct UserProfileView: View {
    var id = String()
    var body: some View {
        NavigationView {
            VStack {
                Text("User Profile")
                    .font(.largeTitle)
            }
            .frame(maxHeight: .infinity)
            .background(.red)
           
        }
    }
}

#Preview {
    UserProfileView()
}
