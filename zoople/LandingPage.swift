import SwiftUI

struct LandingPage: View {
    @State private var isTrue = false
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        NavigationStack {
            VStack {
                header
                ZStack{
                    Color.red
                    TabView {
                        Group{
                            HomeView()
                                .tabItem {
                                    Image(systemName: "house.fill")
                                        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                                }
                                
                            YourDownloadsView()
                                .tabItem {
                                    Image(systemName: "tray.and.arrow.down.fill")
                                }
                            
                            YourUploadsView()
                                .tabItem {
                                    Image(systemName: "tray.and.arrow.up.fill")
                                }
                            
                            UserListView()
                                .tabItem {
                                    Image(systemName: "person.2.fill")
                                }
                            
                            UserProfileView()
                                .tabItem {
                                    Image(systemName: "person.fill")
                                }
                        }
                        
                        .toolbarBackground(.visible, for: .tabBar)
                            
                    }
                    .background(Color(.clear))
                    .accentColor(Color("tabviewselected"))
                }
            }
                        .navigationDestination(isPresented: $isTrue) {
                SearchPageView()
            }
//            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    
   
    var header: some View {
        HStack {
            Image("pro_pic")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading)
            
            VStack (alignment: .leading, spacing: 1) {
                Text("Welcome")
                    .font(.system(size: 14, weight: .regular))
                Text("Diana Susan")
                    .font(.system(size: 18, weight: .regular))
            }
            
          
            
            
            Spacer()
            
            Button(action: {
                isTrue = true
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .padding(.trailing)
                    .foregroundColor(.black)
            }
        }
        .frame(height: 50)
        .background(Color("headerBackground"))
        .onAppear {
                        animationAmount = 1.2
                    }
    }
    
    }

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}




