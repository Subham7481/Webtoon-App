
import SwiftUI

struct RatingView: View {
    @State private var rating: Int = 0 
    @State private var totalRatings: Int = 0
    @State private var ratingSum: Int = 0
    
    var averageRating: Double {
        totalRatings == 0 ? 0.0 : Double(ratingSum) / Double(totalRatings)
    }
    
    var body: some View {
        VStack {
            Text("Rate this Webtoon")
                .font(.title)
                .padding()
            
            // Star rating
            HStack {
                ForEach(1..<6) { star in
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(star <= rating ? .yellow : .gray)
                        .onTapGesture {
                            updateRating(newRating: star)
                        }
                }
            }
            .padding()

       
            Text("Average Rating: \(averageRating, specifier: "%.1f")")
                .font(.headline)
                .padding()
        }
    }

    private func updateRating(newRating: Int) {
    
        ratingSum = ratingSum - rating + newRating
        rating = newRating
        if totalRatings == 0 {
            totalRatings = 1
        }
    }
}

#Preview {
    RatingView()
}
