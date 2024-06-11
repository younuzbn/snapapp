import SwiftUI
import Firebase

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isTrue = false
    @State private var isLoggedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    @FocusState private var focusedField: Field?

    enum Field: Hashable {
        case email, password
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()

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
                        TextField("Enter your email", text: $email)
                            .multilineTextAlignment(.center)
                            .focused($focusedField, equals: .email)
                            .onChange(of: email) { _, newValue in
                                isEmailValid = email.isEmpty || isValidEmail(email)
                            }
                            .onChange(of: focusedField) { oldValue, newValue in
                                if oldValue == .email && newValue != .email {
                                    isEmailValid = email.isEmpty || isValidEmail(email)
                                }
                            }
                        Image(systemName: "eye")
                            .frame(width: 50, height: 50)
                            .foregroundColor(.clear)
                    }
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(isEmailValid ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .padding(.top, 15)

                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading)
                        SecureField("Password", text: $password)
                            .multilineTextAlignment(.center)
                            .focused($focusedField, equals: .password)
                            .onChange(of: password) { _, newValue in
                                isPasswordValid = password.isEmpty || isValidPassword(password)
                            }
                            .onChange(of: focusedField) { oldValue, newValue in
                                if oldValue == .password && newValue != .password {
                                    isPasswordValid = password.isEmpty || isValidPassword(password)
                                }
                            }
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
                        loginAction()
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
                    .padding(.bottom, 20) 
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .background(Color.white)
            }
            .navigationDestination(isPresented: $isTrue) {
                Registrationscreen()
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                LandingPage()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func loginAction() {
        if email.isEmpty || password.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
        } else if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
        } else {
            login()
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                alertMessage = "Invalid credentials"
                showAlert = true
            } else {
                alertMessage = "Loggin successful."
                isLoggedIn = true
            }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
    
}



#Preview {
    LoginScreen()
}
