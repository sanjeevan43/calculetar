import SwiftUI

enum WorldWonders: String, CaseIterable {
    case Taj_Mahal = "Taj Mahal"
    case Great_Wall_of_China = "Great Wall of China"
    case Chichén_Itzá = "Chichén Itzá"
    case pyramid = "pyramid"
    case Machu_Picchu = "Machu Picchu"
    case Colosseum = "Colosseum"
    case Christ_the_Redeemer = "Christ the Redeemer"
}

struct WondersView: View {
    let array: [String] = ["Taj_Mahal", "Great_Wall_of_China", "pyramid", "Chichén_Itzá", "Machu_Picchu", "Colosseum", "Christ_the_Redeemer"]
    
    @State private var isAnimating = false
    @State private var selectedWonder: WorldWonders = .Taj_Mahal
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    ForEach(array, id: \.self) { i in
                        Button(action: {
                            if let wonder = WorldWonders(rawValue: i.replacingOccurrences(of: "_", with: " ")) {
                                selectedWonder = wonder
                            }
                        }) {
                            Image(i)
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
            if selectedWonder == .Taj_Mahal {
                Image("Taj_Mahal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(isAnimating ? 1.0 : 0.8)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Taj Mahal")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .Great_Wall_of_China {
                Image("Great_Wall_of_China")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Great Wall of China")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .Chichén_Itzá {
                Image("Chichén_Itzá")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Chichén Itzá")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .pyramid {
                Image("pyramid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Pyramid")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .Machu_Picchu {
                Image("Machu_Picchu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Machu Picchu")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .Colosseum {
                Image("Colosseum")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Colosseum")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            } else if selectedWonder == .Christ_the_Redeemer {
                Image("Christ_the_Redeemer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: isAnimating)
                Text("Christ the Redeemer")
                    .font(.headline)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(0.3), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    WondersView()
}
