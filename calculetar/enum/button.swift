import SwiftUI

enum worldWonders: String, CaseIterable {
    case Taj_Mahal = "Taj Mahal"
    case Great_Wall_of_China = "Great Wall of China"
    case Chichén_Itzá = "Chichén Itzá"
    case pyramid = "pyramid"
    case Machu_Picchu = "Machu Picchu"
    case Colosseum = "Colosseum"
    case Christ_the_Redeemer = "Christ the Redeemer"
}

struct wondersView: View {
    let array: [String] = ["Taj Mahal", "Great Wall of China", "pyramid", "Chichén Itzá", "Machu Picchu", "Colosseum", "Christ the Redeemer"]
    
    @State private var selectedWonder: WorldWonders = .Taj_Mahal

    @State private var isPressed = false
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    ForEach(array, id: \.self) { i in
                        Button(action: {
                            if let wonder = WorldWonders(rawValue: i) {
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
                    Text(wonder)
                        .font(.headline)
                       
                }
            }
        }
       
            
      
    }
}

#Preview {
    wondersView()
}



