import SwiftUI

struct DetailView: View {
    var webtoonCategory: WebtoonCategory
    @State private var isFavorite = false

    var body: some View {
        VStack {
    
            Image(webtoonCategory.detailImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            

            Text(webtoonCategory.title)
                .font(.title)
                .padding(.vertical, 5)
            
 
            Text(webtoonCategory.description)
                .padding(.vertical, 10)
                .font(.body)
                .multilineTextAlignment(.leading)
       
            Button(action: {
                isFavorite.toggle()
                updateFavorites()
            }) {
                Text(isFavorite ? "Added to Favorites" : "Add to Favorites")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isFavorite ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

     
            NavigationLink(destination: RatingView()) {
                Text("Rate this Webtoon")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding(.top, 20)
        }
        .navigationTitle(webtoonCategory.title)
        .onAppear {
            checkIfFavorite()
        }
    }


    func updateFavorites() {
        var currentFavorites: [WebtoonCategory] = []
        

        if let savedFavorites = UserDefaults.standard.data(forKey: "favorites"),
           let decodedFavorites = try? JSONDecoder().decode([WebtoonCategory].self, from: savedFavorites) {
            currentFavorites = decodedFavorites
        }
        

        if isFavorite {
            if !currentFavorites.contains(where: { $0.id == webtoonCategory.id }) {
                currentFavorites.append(webtoonCategory)
            }
        } else {
            currentFavorites.removeAll { $0.id == webtoonCategory.id }
        }

        if let encodedFavorites = try? JSONEncoder().encode(currentFavorites) {
            UserDefaults.standard.set(encodedFavorites, forKey: "favorites")
        }
    }
    
    func checkIfFavorite() {
        if let savedFavorites = UserDefaults.standard.data(forKey: "favorites"),
           let decodedFavorites = try? JSONDecoder().decode([WebtoonCategory].self, from: savedFavorites) {
            isFavorite = decodedFavorites.contains(where: { $0.id == webtoonCategory.id })
        }
    }
}

#Preview {
    DetailView(webtoonCategory: WebtoonCategory(title: "Lore Olympus", thumbnail: "lore_olympus_image", detailImage: "lore_olympus_detail", description: "Lore Olympus is a modern retelling of the Greek myth of Hades and Persephone..."))
}
