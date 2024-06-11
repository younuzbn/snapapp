import SwiftUI

struct HomeView: View {
    @State private var model = [Datum]()
    @State private var model1 = [StoryModel]()
    var body: some View {
//        NavigationView {
        ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Latest Snaps")
                        .font(.system(size: 28, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                    
                 
                   
                    ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    
                                    ForEach(model, id: \.id) { i in
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
                                            
                                           
                                        
                    
                    
                    
                 
                    
                    Text("View More")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 3.0)
                    
                   
                        VStack {
                            ForEach(model,id: \.id) {i in
                            
                                VStack{
                                    HStack(){
                                        AsyncImage(url:URL(string: i.owner.picture)){phase in
                                            if let img = phase.image{
                                                img
                                                    .resizable()
                                                    .frame(width: 50,height: 50)
                                                    .cornerRadius(25)
                                                    
                                            }
                                            
                                        }
                                        
                                        VStack(alignment: .leading){
                                            Text("\(i.owner.firstName) \(i.owner.lastName)")
                                            
                                            Text(formatDate(i.publishDate))
                                                .font(.caption)
                                        }
                                        Spacer()
                                        Image(systemName: "tray.and.arrow.down")
                                    }
                                    
                                    AsyncImage(url: URL(string: i.image)){
                                        i in
                                        if let img = i.image{
                                            img
                                                .resizable()
                                            
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(10)
                                        }
                                    }
                                        
                                        HStack {
                                            VStack {
                                                Image(systemName: "heart")
                                                    .resizable()
                                                    .frame(width: 29, height: 25)
                                                Text("\(i.likes)")
                                            }
                                            
                                            VStack {
                                                Image(systemName: "message")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                                Text("\(5)")
                                            }
                                            .padding()
                                           
                                            
                                            Spacer()
                                            
                                        }
                                    HStack{
                                        Text("\(i.owner.firstName) \(i.owner.lastName)")
                                            .font(.caption)
                                        ForEach(i.tags,id: \.self){ t in
                                            Text("\(t)")
                                                .font(.caption)
                                        }
                                        Spacer()
                                    }
                                        
                                        Divider()
                                    
                                    
                                }
                               
                            }
                    }
                }
//                .background(.red)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
//            }
            
        }
        .navigationBarHidden(true)
        .task {
           await getUserPost()
        }
    }
    func getUserPost() async {
        guard let url = URL(string: "https://dummyapi.io/data/v1/post?limit=10") else {
            print("invalid url")
            return
        }
            
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("63624d572c4963279137bac2", forHTTPHeaderField: "app-id")
       
        URLSession.shared.dataTask(with: urlRequest) { data, reap, err in
            if let data = data {
                do {
                  
                    let json = try JSONDecoder().decode(postModel.self, from: data)
                    model = json.data
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }.resume()
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
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }.resume()
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd - MM - yyyy"
            return outputFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }


    
    

}

#Preview {
    HomeView()
}
