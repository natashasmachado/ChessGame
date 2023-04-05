//
//  Board.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Board {
  var board: [[Piece?]] = Array(repeating: Array(repeating: nil, count: 8), count: 8)
  var currentPlayer: Color = .white
  var gameOver: Bool = false
  
  init() {
    gameBoard()
  }
  
  func gameBoard() {
    board[0][0] = Piece(color: .white, type: .rook)
    board[0][1] = Piece(color: .white, type: .knight)
    board[0][2] = Piece(color: .white, type: .bishop)
    board[0][3] = Piece(color: .white, type: .queen)
    board[0][4] = Piece(color: .white, type: .king)
    board[0][5] = Piece(color: .white, type: .bishop)
    board[0][6] = Piece(color: .white, type: .knight)
    board[0][7] = Piece(color: .white, type: .rook)
    for i in 0...7 {
      board[1][i] = Piece(color: .white, type: .pawn)
    }
    board[7][0] = Piece(color: .black, type: .rook)
    board[7][1] = Piece(color: .black, type: .knight)
    board[7][2] = Piece(color: .black, type: .bishop)
    board[7][3] = Piece(color: .black, type: .queen)
    board[7][4] = Piece(color: .black, type: .king)
    board[7][5] = Piece(color: .black, type: .bishop)
    board[7][6] = Piece(color: .black, type: .knight)
    board[7][7] = Piece(color: .black, type: .rook)
    for i in 0...7 {
      board[6][i] = Piece(color: .black, type: .pawn)
    }
  }
  
  func display() {
    print("  a b c d e f g h")
    for i in 0..<8 {
      print("\(8-i) ", terminator: "")
      for j in 0..<8 {
        if let piece = board[i][j] {
          switch piece.type {
          case .king:
            print(piece.color == .white ? "♔" : "♚", terminator: "")
          case .queen:
            print(piece.color == .white ? "♕" : "♛", terminator: "")
          case .bishop:
            print(piece.color == .white ? "♗" : "♝", terminator: "")
          case .knight:
            print(piece.color == .white ? "♘" : "♞", terminator: "")
          case .rook:
            print(piece.color == .white ? "♖" : "♜", terminator: "")
          case .pawn:
            print(piece.color == .white ? "♙" : "♟︎", terminator: "")
            
          }
        } else {
          print("·", terminator: "")
        }
        print(" ", terminator: "")
      }
      print(" \(8-i)")
    }
    print("  a b c d e f g h")
  }
}
