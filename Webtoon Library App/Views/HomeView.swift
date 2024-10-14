
import SwiftUI

struct WebtoonCategory: Identifiable, Codable {
    let id = UUID()
    let title: String
    let thumbnail: String
    let detailImage: String
    let description: String
}

let imageDescription1 = "Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates."
let imageDescription2 = "Do you believe in supernatural creatures like werewolves, vampires, and witches? How would you feel if one day you were transported to a different realm when you touched a painting? The same thing happened with Serena in The Alpha King’s Claim. One rainy day, she buys an interesting painting while taking shelter in a painting shop. When she touched the painting at her home, she got transported to the realm where werewolves lived. Moreover, she ends up on the bed of the Alpha King Aero, who hates all women."
let imageDescription3 = "Do you believe vampires exist? What would your first reaction be if you crossed paths with a vampire? Would you be delighted, terrified, or unsure of how to act? Well, Chae-i certainly had an unusual reaction than the others. Chae-i is an actress who has been in the entertainment industry ever since she can remember. However, she is been having a hard time fitting in with other actors due to the extremely painful headaches she started having a little while ago. As a consequence of this, her professional life started deteriorating."
let imageDescription4 = "How would you feel if one day you woke up in the novel you wrote just after dying in the real world? Would you feel ecstatic to have a chance to live again? Or would you feel scared because of the uncertain possibilities and the danger lurking? Daisy is a woman with a kind yet strong personality. Following her death in the real world, she wakes up in the novel she wrote with her nine other friends just for fun. Unfortunately, her living conditions do not change much. However, one random day, she is arrested by the duke’s soldier for helping her friend out."
let imageDescription5 = "The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?"
let imageDescription6 = "Paris is known as the city of love by the whole world. Would you consider going there freshly after a breakup? Jian is a beautiful young woman who works in the fashion industry. One day, she discovers that her new handsome boss is the person she had been hooked up with in France. She dismisses it, thinking that he probably does not remember her since it has been so long. However, she is proved wrong. "
let imageDescription7 = "Do you believe that people judge others based on their outer appearance? Have you ever been judged based on your looks? Kiyo is an ex-idol trainee who wants to live like a normal teenager. In this attempt, he starts living with his grandmother and enrolls in a new school. He even starts wearing ugly-looking glasses to hide his exceptional looks. There, he meets Lily, another victim of the same thing. People fear her and her father just because of their scary features, even though they are nice."
let imageDescription8 = "If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events."
let imageDescription9 = "The popular webtoon series Seasons of Blossom is a compilation of several individual stories that are all connected. It contains all four seasons: spring, summer, fall, and winter. Each season contains a different story and a different theme with different endings. It focuses majorly on school bullying and how much it can affect someone’s whole life."
let imageDescription10 = "Are you an organized person who keeps track of every detail, disregarding how insignificant it may be, or are you a messy person who goes with the flow? Bareum is a very organized person who even maintains a diary detailing all her events and commitments. She has always had great marks and a clear record of what she wants to do in the future."


let categories = [
    WebtoonCategory(title: "Hello Baby", thumbnail: "hello_baby_thumbnail", detailImage: "Image1", description: imageDescription1),
        WebtoonCategory(title: "The Alpha King’s Claim", thumbnail: "alpha_king_thumbnail", detailImage: "Image2",
                        description: imageDescription2),
        WebtoonCategory(title: "Bitten Contract", thumbnail: "bitten_contract_thumbnail", detailImage: "Image3", description: imageDescription3),
        WebtoonCategory(title: "Tricked into Becoming the Heroine’s Stepmother", thumbnail: "fantasy_thumbnail", detailImage: "Image4", description: imageDescription4),
        WebtoonCategory(title: "The Guy Upstairs", thumbnail: "thriller_thumbnail", detailImage: "Image5",
                        description: imageDescription5),
        WebtoonCategory(title: "The Runaway", thumbnail: "runaway_thumbnail", detailImage: "Image6", description: imageDescription6),
        WebtoonCategory(title: "Your Smile Is A Trap", thumbnail: "smile_trap_thumbnail", detailImage: "Image7",
                        description: imageDescription7),
        WebtoonCategory(title: "There Must Be Happy Endings", thumbnail: "happy_endings_thumbnail", detailImage: "Image8", description: imageDescription8),
        WebtoonCategory(title: "Seasons of Blossom", thumbnail: "blossom_thumbnail", detailImage: "Image9", description: imageDescription9),
        WebtoonCategory(title: "Romance 101", thumbnail: "romance_101_thumbnail", detailImage: "Image10", description: imageDescription10)
]


struct HomeView: View {
    var body: some View {
        NavigationView {
                   List(categories) { category in
                       NavigationLink(destination: DetailView(webtoonCategory: category)) {
                           HStack {
                               Image(category.detailImage)
                                   .resizable()
                                   .frame(width: 50, height: 50)
                               Text(category.title)
                           }
                       }
                   }
                   .navigationTitle("Webtoon Categories")
                               .navigationBarItems(trailing: NavigationLink(destination: FavouritesScreenView()) {
                                   Text("Favorites")
                                       .font(.system(size: 16))
                               })
                        }
                    }
                }

#Preview {
HomeView()
}
