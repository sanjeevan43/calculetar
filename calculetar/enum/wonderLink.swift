import SwiftUI
enum WorldWondersLink: String, CaseIterable {
    case Taj_Mahal = "Taj Mahal"
    case Great_Wall_of_China = "Great Wall of China"
    case Chichén_Itzá = "Chichén Itzá"
    case Pyramid = "pyramid"
    case Machu_Picchu = "Machu Picchu"
    case Colosseum = "Colosseum"
    case Christ_the_Redeemer = "Christ the Redeemer"
}
struct WondersViewLink: View {
    let array: [String] = ["Taj Mahal", "Great Wall of China", "pyramid", "Chichén Itzá", "Machu Picchu", "Colosseum", "Christ the Redeemer"]
    let link: [String] = [
        "https://www.britannica.com/topic/Taj-Mahal",
        "https://whc.unesco.org/en/list/43",
        "https://www.britannica.com/technology/pyramid-architecture",
        "https://whc.unesco.org/en/list/483/",
        "https://whc.unesco.org/en/list/274/",
        "https://www.rome.net/colosseum",
        "https://world.new7wonders.com/wonders/cristo-redentor-1931-rio-de-janeiro-brazil/"
    ]
    @State private var selectedWonder: WorldWondersLink = .Taj_Mahal
    @State private var isPressed = false
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    ForEach(array, id: \.self) { i in
                        Button(action: {
                            if let wonder = WorldWondersLink(rawValue: i) {
                                selectedWonder = wonder
                            }
                        }) {
                            Image(i.replacingOccurrences(of: " ", with: "_"))
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }

        VStack {
            ForEach(array, id: \.self) { wonder in
                if selectedWonder.rawValue == wonder {
                    Image(wonder.replacingOccurrences(of: " ", with: "_"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(isPressed ? 0 : 1)
                        .rotationEffect(Angle(degrees: isPressed ? 360 : 0))
                        .animation(.easeInOut(duration: 2), value: isPressed)
                    
                    if let index = array.firstIndex(of: wonder) {
                        Link(wonder, destination: URL(string: link[index])!)
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    WondersViewLink()
}
