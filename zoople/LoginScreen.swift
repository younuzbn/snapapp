import SwiftUI

struct LoginScreen: View {
    @State private var username = String()
    @State private var password = String()
    @State private var isTrue: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                VStack {
                    Spacer()
                    
                    Image("login_icon")
                    Spacer()
                    Text("Sign in to your account")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.textClr)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "person")
                            .padding(.leading)
                        TextField("Enter your email", text: $username)
                            .multilineTextAlignment(.center)
                        Image(systemName: "eye")
                            .frame(width: 50, height: 50)
                            .foregroundColor(.clear)
                    }
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.top, 15)
                    
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading)
                        TextField("Password", text: $password)
                            .multilineTextAlignment(.center)
                        Image(systemName: "eye")
                            .frame(width: 50, height: 50)
                    }
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.top, 5)
                    
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .foregroundStyle(.textClr)
                    }
                    .padding(.top, 10)
                    
                    Button("Sign in") {
                        print("Login")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.textClr)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Text("- Or Sign in with -")
                        .foregroundStyle(.textClr)
                        .padding(.vertical, 10)
                    
                    HStack {
                        Image(systemName: "apple.logo")
                            .frame(width: 60, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1)
                            )
                        Image(systemName: "face.smiling.inverse")
                            .frame(width: 60, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            print("signup")
                            isTrue = true
                        }) {
                            Text("Don’t have an account? No worries Sign Up now")
                                .font(.system(size: 13))
                                .foregroundStyle(.textClr)
                        }
                    }
                    .padding(.bottom, 20) // Add some padding for better spacing
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .background(.white)
            }
            .navigationDestination(isPresented: $isTrue) {
                Registrationscreen()
            }
        }
    }
}



#Preview {
    LoginScreen()
}
