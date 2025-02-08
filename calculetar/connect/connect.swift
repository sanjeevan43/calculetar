import SwiftUI

struct Connect: View {
    @StateObject private var game = Game()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Connect 4")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                BoardView(game: game)
                
                if let winner = game.winner {
                    Text(winner == "Draw" ? "It's a Draw!" : "Player \(winner) Wins!")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Button("Restart") {
                    game.reset()
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct BoardView: View {
    @ObservedObject var game: Game
    
    var body: some View {
        VStack {
            ForEach(0..<6, id: \.self) { row in
                HStack {
                    ForEach(0..<7, id: \.self) { col in
                        Button(action: {
                            game.play(row: row, col: col)
                        }) {
                            Text(String(game.board[row][col]))
                                .font(.system(size: 50, weight: .bold))
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                        .disabled(game.board[row][col] != "_" || game.winner != nil)
                    }
                }
            }
        }
    }
}

class Game: ObservableObject {
    @Published var board: [[Character]] = Array(repeating: Array(repeating: "_", count: 7), count: 6)
    @Published var currentPlayer: Character = "X"
    @Published var winner: String? = nil
    
    func isWin() -> Bool {
        for row in 0..<6 {
            for col in 0..<7 {
                if board[row][col] != "_" {
                    let player = board[row][col]
                    
                    if col <= 3 && board[row][col+1] == player && board[row][col+2] == player && board[row][col+3] == player {
                        winner = String(player)
                        return true
                    }
                    
                    if row <= 2 && board[row+1][col] == player && board[row+2][col] == player && board[row+3][col] == player {
                        winner = String(player)
                        return true
                    }
                    
                    if row <= 2 && col <= 3 && board[row+1][col+1] == player && board[row+2][col+2] == player && board[row+3][col+3] == player {
                        winner = String(player)
                        return true
                    }
                    
                    if row >= 3 && col <= 3 && board[row-1][col+1] == player && board[row-2][col+2] == player && board[row-3][col+3] == player {
                        winner = String(player)
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func isDraw() -> Bool {
        if !board.joined().contains("_") && winner == nil {
            winner = "Draw"
            return true
        }
        return false
    }
    
    func play(row: Int, col: Int) {
        if setCoin(row: row, col: col, coin: currentPlayer) {
            if isWin() {
                print("Player \(currentPlayer) wins!")
            } else if isDraw() {
                print("The game is a draw.")
            } else {
                switchPlayer()
                print("It's \(currentPlayer)'s turn.")
            }
        } else {
            print("Invalid move. Try again.")
        }
    }
    
    func setCoin(row: Int, col: Int, coin: Character) -> Bool {
        for r in (0..<6).reversed() {
            if board[r][col] == "_" {
                board[r][col] = currentPlayer
                return true
            }
        }
        return false
    }
    
    func switchPlayer() {
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
    }
    
    func reset() {
        board = Array(repeating: Array(repeating: "_", count: 7), count: 6)
        currentPlayer = "X"
        winner = nil
    }
}

#Preview {
    Connect()
}
