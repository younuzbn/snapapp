//
//  zoopleApp.swift
//  zoople
//
//  Created by Younuz Bin Noushad on 21/05/24.
//

import SwiftUI
import Firebase

@main
struct zoopleApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



//add likes and comment count Section
//add caption section and align it to the centre
//search page story is not loading
//complete profile and user create in firestore
