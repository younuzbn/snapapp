import SwiftUI
import Firebase

struct Registrationscreen: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var verifyPassword = ""
    @State private var passwordhidden = true
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isTrue = false
    @State private var isLoggedIn = false
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) var dismiss

    enum Field: Hashable {
        case name, email, password, verifyPassword
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
                    Text("Register your account")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.textClr)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "person")
                            .padding(.leading)
                        TextField("Enter your name", text: $name)
                            .multilineTextAlignment(.center)
                            .focused($focusedField, equals: .name)
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
                        Image(systemName: "tray")
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
                        if passwordhidden {
                            SecureField("Enter the password", text: $password)
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

                        } else {
                            TextField("Enter the password", text: $password)
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
                        }
                            
                        Button(action: {
                            passwordhidden.toggle()
                        }, label: {
                            Image(systemName: passwordhidden ? "eye.slash" : "eye")
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                        })
                    }
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(isPasswordValid ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .padding(.top, 15)
                    
                
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading)
                        SecureField("Re-enter the password", text: $verifyPassword)
                            .multilineTextAlignment(.center)
                            .focused($focusedField, equals: .verifyPassword)
                        
                        ZStack {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.clear)
                            
                            if !password.isEmpty && !verifyPassword.isEmpty {
                                if password == verifyPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                        .frame(width: 50, height: 50)
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                    }
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(password == verifyPassword ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Button(action: {
                        signUpAction()
                    }) {
                        Text("Sign up")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.textClr)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                            
                    }
                    
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
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Already have an account? Sign in now")
                            .font(.system(size: 13))
                            .foregroundStyle(.textClr)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .background(Color.white)
            }
            .navigationDestination(isPresented: $isTrue) {
                LoginScreen()
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                AddProfilePhotoScreen()
            }
        }
        .navigationBarHidden(true)
    }
    
 
    func signUpAction() {
        if name.isEmpty || email.isEmpty || password.isEmpty || verifyPassword.isEmpty {
            alertMessage = "Please fill in all fields."
        } else if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
        } else if !isValidPassword(password) {
            alertMessage = "Password must be at least 8 characters long and include at least one letter, one number, and one special character."
        } else if password != verifyPassword {
            alertMessage = "Passwords do not match."
        } else {
            register()
            alertMessage = "Registration successful."
          isLoggedIn = true

            clearFields()
        }
        showAlert = true
    }
        
    func clearFields() {
        name = ""
        email = ""
        password = ""
        verifyPassword = ""
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
    
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { Result, error in if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct Registrationscreen_Previews: PreviewProvider {
    static var previews: some View {
        Registrationscreen()
    }
}
