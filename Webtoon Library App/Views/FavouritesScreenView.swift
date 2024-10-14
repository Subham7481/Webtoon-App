import SwiftUI

struct FavouritesScreenView: View {
    @State private var favorites: [WebtoonCategory] = []
    
    var body: some View {
        NavigationView {
            List(favorites) { webtoon in
                HStack {
                    Image(webtoon.thumbnail)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(webtoon.title)
                }
            }
            .navigationTitle("Favorites")
            .onAppear {
                loadFavorites()
            }
        }
    }
 
    func loadFavorites() {
        if let savedFavorites = UserDefaults.standard.data(forKey: "favorites"),
           let decodedFavorites = try? JSONDecoder().decode([WebtoonCategory].self, from: savedFavorites) {
            self.favorites = decodedFavorites
        }
    }
}

#Preview {
    FavouritesScreenView()
}
