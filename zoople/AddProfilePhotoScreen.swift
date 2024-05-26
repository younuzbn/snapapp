import SwiftUI

struct AddProfilePhotoScreen: View {
    @State private var selectedTag = 0
    @State private var isTrue: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: .constant(selectedTag)) {
                    OnboardView().tag(0)
                    SelectAgeScreen().tag(1)
                    AddInterests().tag(2)
                }
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                VStack {
                    Spacer()
                    Spacer()
                    HStack {
                        Text("Skip")
                            .foregroundStyle(.textClr)
                            .font(.system(size: 20))
                        Spacer()
                        Button(action: {
                            if selectedTag < 2 {
                                selectedTag += 1
                            } else {
                                isTrue = true
                            }
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.textClr)
                                .font(.system(size: 45))
                        }
                    }
                    .padding(.bottom, 100)
                    .padding(.horizontal, 25)
                }
            }
            .navigationDestination(isPresented: $isTrue) {
                CompletionScreen()
            }
        }
    }
}



#Preview {
    AddProfilePhotoScreen()
}
