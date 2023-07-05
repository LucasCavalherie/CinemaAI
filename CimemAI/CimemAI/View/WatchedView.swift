import SwiftUI

struct WatchedView: View {
    @State private var watched = DataManager.shared.getContentsFromWatched()
    
    var body: some View {
        ScrollView {
            VStack(alignment:.center) {
                
                HStack(alignment: .bottom) {
                    
                    Text("Assitidos")
                        .font(Font.custom("Poppins", size: 30) .weight(.bold))
                        .foregroundColor(Color(red: 0.61, green: 0.13, blue: 0.15))
                        .padding(.leading, 40)
                    
                    Spacer()
                    
                    Image("coração mascotinho")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.top)
                        .padding(.bottom, 6)
                        .padding(.trailing, 43)
                }
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 323, height: 1)
                    .background(Color(red: 0.61, green: 0.13, blue: 0.15))
            }
            .padding(.bottom, 10)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(watched) { favoriteItem in
                        switch favoriteItem.content {
                        case .filme(let filmData):
                            if filmData.watched {
                                ContentCard(watchedContent: favoriteItem)
                            }
                        case .serie(let serieData):
                            if serieData.watched {
                                ContentCard(watchedContent: favoriteItem)
                            }
                        }
                    }
                }.padding(.vertical, 8)
            }



        }
    }
}



struct WatchedViews_Previews: PreviewProvider {
    static var previews: some View {
        WatchedView()
    }
}
