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
    
  var whiteKing: King? = nil
  var whitePieces: [Piece] = []
  var blackKing: King? = nil
  var blackPieces: [Piece] = []
    
  
  init() {
    gameBoard()
  }
  
  func gameBoard() {
    board[0][0] = Piece(color: .white, type: .rook, position: (0,0))
    board[0][1] = Piece(color: .white, type: .knight, position: (0,1))
    board[0][2] = Piece(color: .white, type: .bishop, position: (0,2))
    board[0][3] = Piece(color: .white, type: .queen, position: (0,3))
    board[0][4] = Piece(color: .white, type: .king, position: (0,4))
    whiteKing = board[0][4]
    board[0][5] = Piece(color: .white, type: .bishop, position: (0,5))
    board[0][6] = Piece(color: .white, type: .knight, position: (0,6))
    board[0][7] = Piece(color: .white, type: .rook, position: (0,7))
    for i in 0...7 {
      board[1][i] = Piece(color: .white, type: .pawn, position: (1,i))
      whitePieces.append(board[1][i])
      whitePieces.append(board[0][i])
    }
    board[7][0] = Piece(color: .black, type: .rook, position: (7,0))
    board[7][1] = Piece(color: .black, type: .knight, position: (7,1))
    board[7][2] = Piece(color: .black, type: .bishop, position: (7,2))
    board[7][3] = Piece(color: .black, type: .queen, position: (7,3))
    board[7][4] = Piece(color: .black, type: .king, position: (7,4))
    blackKing = board[7][4]
    board[7][5] = Piece(color: .black, type: .bishop, position: (7,5))
    board[7][6] = Piece(color: .black, type: .knight, position: (7,6))
    board[7][7] = Piece(color: .black, type: .rook, position: (7,7))
    for i in 0...7 {
      board[6][i] = Piece(color: .black, type: .pawn, position: (6,i))
        blackPieces.append(board[6][i])
        blackPieces.append(board[7][i])
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
  
  func help() {
    print("Please enter your command:")
    print("-> Type 'help' for help")
    print("-> Type 'board' to see the board again")
    print("-> Type 'resign' to resign")
    print("-> Type 'moves' to list all possible moves")
    print("-> Type a square (e.g. b1, e2) to list possible moves for that square")
    print("-> Type UCI (e.g. b1c3, e7e8q) to make a move")
    
    if let input = readLine() {
      switch input {
      case "help":
        print(help())
        break
      case "board":
        display()
        break
      case "resign":
          print("Game over - \(currentPlayer.antiColor().rawValue) won by resignation")
          gameOver = true
        break
      case "moves":
        
        break
      case "square":
        
        break
      case "uci" :
        
        break
      default:
        print("Invalid command")
        break
      }
    }
  }
}
