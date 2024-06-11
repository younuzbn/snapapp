//import Foundation
//import FirebaseAuth
//
//class AuthViewModel: ObservableObject {
//    @Published var isLoggedIn: Bool = false
//    
//    init() {
//        self.isLoggedIn = Auth.auth().currentUser != nil
//    }
//    
//    func signIn(email: String, password: String, completion: @escaping (String?) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                completion(error.localizedDescription)
//            } else {
//                self.isLoggedIn = true
//                completion(nil)
//            }
//        }
//    }
//    
//    func signOut() {
//        do {
//            try Auth.auth().signOut()
//            self.isLoggedIn = false
//        } catch let error {
//            print("Error signing out: \(error.localizedDescription)")
//        }
//    }
//}


import Foundation

// MARK: - Welcome
struct postModel: Codable {
    let data: [Datum]
    let total, page, limit: Int
}

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text, publishDate: String
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    let id, title, firstName, lastName: String
    let picture: String
}

