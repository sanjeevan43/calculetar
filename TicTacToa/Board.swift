import SwiftUI

class DisplayBoard: ObservableObject {
    @Published var displayText: String = ""

    func getBoardView(rows: Int , columns: Int) -> some View {
    
        HStack {
            ForEach(0..<rows, id: \.self) { _ in
                VStack {
                    ForEach(0..<columns, id: \.self) { _ in
                        Button {
                           //
                        } label: {
                            Text("_")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(25)
                        }
                    }
                }
            }
        }
    }
}

struct Board: View {
    @StateObject var displayBoard = DisplayBoard()
    var rows: Int = 3
    var columns: Int = 3
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            HStack{
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fixedSize()
                    .frame(width: 200, height: 50)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.top)
                    .position(x: 190, y: 120)
                  
            }
            VStack {
                displayBoard.getBoardView(rows: rows, columns: columns)
               Text(displayBoard.displayText)
                    .font(.title)
                    .padding()
            }
        }
    }
}

#Preview {
    Board()
}
