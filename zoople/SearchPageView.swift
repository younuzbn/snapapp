import SwiftUI

struct SearchPageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var model = [Datum]()
    @State private var model1 = [StoryModel]()
    var body: some View {
        VStack {
            
            
            
            HStack {
                
                
                TextField("Search", text: $searchText)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
            }
            .padding(.horizontal, 16)
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    HStack {
                        Image("103")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(7)
                            .padding(.leading, 10)
                           
                        Text("adorable")
                            .padding(.trailing, 10)
                       }
                    .frame( height: 54)
                    .cornerRadius(10)
                    .background(Color(.tabviewbg))
                    .cornerRadius(10)
                    
                    HStack {
                        Image("103")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(7)
                            .padding(.leading, 10)
                           
                        Text("adorable")
                            .padding(.trailing, 10)
                       }
                    .frame( height: 54)
                    .cornerRadius(10)
                    .background(Color(.tabviewbg))
                    .cornerRadius(10)
                    
                    HStack {
                        Image("103")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(7)
                            .padding(.leading, 10)
                           
                        Text("adorable")
                            .padding(.trailing, 10)
                       }
                    .frame(
                        height: 54)
                    .cornerRadius(10)
                    .background(Color(.tabviewbg))
                    .cornerRadius(10)
                    
                    HStack {
                        Image("103")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(7)
                            .padding(.leading, 10)
                           
                        Text("adorable")
                            .padding(.trailing, 10)
                       }
                    .frame( height: 54)
                    .cornerRadius(10)
                    .background(Color(.tabviewbg))
                    .cornerRadius(10)
                }
                .padding()
            }
            
            
             ScrollView(.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(model1, id: \.id) { i in
                                 VStack {
                                     AsyncImage(url: URL(string: i.image)) { phase in
                                         switch phase {
                                         case .empty:
                                             ProgressView()
                                                 .frame(width: 100, height: 150)
                                         case .success(let image):
                                             image
                                                 .resizable()
                                                 .aspectRatio(2/3, contentMode: .fill)
                                                 .frame(width: 100, height: 150)
                                                 .clipped()
                                                 .cornerRadius(10)
                                                 .padding(.trailing)
                                         case .failure:
                                             Image(systemName: "photo")
                                                 .resizable()
                                                 .aspectRatio(2/3, contentMode: .fill)
                                                 .frame(width: 100, height: 150)
                                                 .clipped()
                                                 .cornerRadius(10) 
                                         @unknown default:
                                             EmptyView()
                                         }
                                     }
                                 }
                             }
                         }
                         .padding()
                     }
            
            
            
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .task  {
           await getUserPost1()
        }
    }
    

    var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
    }
    
    
    func getUserPost1() async {
        guard let url = URL(string: "https://dummyapi.io/data/v1/tag/water/post?limit=10") else {
            print("invalid url")
            return
        }
            
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("63624d572c4963279137bac2", forHTTPHeaderField: "app-id")
       
        URLSession.shared.dataTask(with: urlRequest) { data, reap, err in
            if let data = data {
                do {
                  
                    let json = try JSONDecoder().decode(Story.self, from: data)
                    model1 = json.data
                    print(model1)
                }catch let err{
                    print(err)
                }
            }
        }.resume()
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
