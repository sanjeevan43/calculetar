////
////  TicTacToaGame.swift
////  calculetar
////
////  Created by sanjeevan on 11/02/25.
////
//
//import SwiftUI
//class GameModel {
//    @Published var board: [[Character]] = Array(repeating: Array(repeating: "_", count: 3), count: 3)
//    @Published var winner: String? = nil
//
//    func playMove() -> Bool {
//        return true
//    }
//    init(board: [[Character]], winner: String? = nil) {
//        self.board = board
//        self.winner = winner
//    }
//    func isWin() -> Bool {
//        for i in 0..<3 {
//            if board[i][0] != "_" && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
//                winner = String(board[i][0])
//                return true
//            }
//            if board[0][i] != "_" && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
//                winner = String(board[0][i])
//                return true
//            }
//        }
//        if board[0][0] != "_" && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
//            winner = String(board[0][0])
//            return true
//        }
//        if board[0][2] != "_" && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
//            winner = String(board[0][2])
//            return true
//        }
//        return false
//    }
//}
//struct TicTacToaGame: View {
//    var gameModel: GameModel = .init(board:  [[",_"], ["_"], ["_"]]")
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    TicTacToaGame()
//}
