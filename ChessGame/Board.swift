//
//  Board.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Board {
  var board: [[Piece?]] = Array(repeating: Array(repeating: nil, count: 8), count: 8)
  var gameOver: Bool = false
  var passant: Position? = nil
  
  init() {
    gameBoard()
  }
  
  func gameBoard() {
    board[0][0] = Piece(color: .white, type: .rook, position: (0,0))
    board[0][1] = Piece(color: .white, type: .knight, position: (0,1))
    board[0][2] = Piece(color: .white, type: .bishop, position: (0,2))
    board[0][3] = Piece(color: .white, type: .queen, position: (0,3))
    board[0][4] = Piece(color: .white, type: .king, position: (0,4))
    board[0][5] = Piece(color: .white, type: .bishop, position: (0,5))
    board[0][6] = Piece(color: .white, type: .knight, position: (0,6))
    board[0][7] = Piece(color: .white, type: .rook, position: (0,7))
    for i in 0...7 {
      board[1][i] = Piece(color: .white, type: .pawn, position: (1,i))
    }
    board[7][0] = Piece(color: .black, type: .rook, position: (7,0))
    board[7][1] = Piece(color: .black, type: .knight, position: (7,1))
    board[7][2] = Piece(color: .black, type: .bishop, position: (7,2))
    board[7][3] = Piece(color: .black, type: .queen, position: (7,3))
    board[7][4] = Piece(color: .black, type: .king, position: (7,4))
    board[7][5] = Piece(color: .black, type: .bishop, position: (7,5))
    board[7][6] = Piece(color: .black, type: .knight, position: (7,6))
    board[7][7] = Piece(color: .black, type: .rook, position: (7,7))
    for i in 0...7 {
      board[6][i] = Piece(color: .black, type: .pawn, position: (6,i))
    }
  }
  
  func display() {
    print("  a b c d e f g h")
    for i in 0..<8 {
      print("\(8-i) ", terminator: "")
      for j in 0..<8 {
        if let piece = board[7-i][j] {
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
  
  func movePiece(move: Move) {
    
    guard let movingPiece = board[move.start.row][move.start.col] else {
      print("No piece found at the starting position.")
      return
    }
    
    guard isMoveValid(piece: movingPiece, move: move) else {
      print("Invalid move for the selected piece.")
      return
    }
    
    if movingPiece.type == .king && abs(move.end.col - move.start.col) == 2 {
      handleCastling(move: move)
    } else if movingPiece.type == .pawn {
      if move.end.row == 0 || move.end.row == 7 {
        handlePawnPromotion(move: move)
      } else if let target = passant, move.end == target {
        handleEnPassant(move: move)
      }
    }
    
    board[move.start.row][move.start.col] = nil
    board[move.end.row][move.end.col] = movingPiece
    movingPiece.position = (move.end.row,move.end.col)
    
  }
  
  func isMoveValid(piece: Piece, move: Move) -> Bool {
    let rowDiff = abs(move.end.row - move.start.row)
    let colDiff = abs(move.end.col - move.start.col)
    
    switch piece.type {
    case .king:
      if rowDiff <= 1 && colDiff <= 1 {
        return true
      } else {
        return false
      }
      
    case .queen:
      return (rowDiff == colDiff) || (rowDiff == 0) || (colDiff == 0)
      
    case .rook:
      return (rowDiff == 0) || (colDiff == 0)
      
    case .bishop:
      return rowDiff == colDiff
      
    case .knight:
      return (rowDiff == 2 && colDiff == 1) || (rowDiff == 1 && colDiff == 2)
      
    case .pawn:
      let direction = piece.color == .white ? 1 : -1
      let rowMove = move.end.row - move.start.row
      let startingRow = piece.color == .white ? 1 : 6
      
      if colDiff == 0 {
        if rowMove == direction {
          return board[move.end.row][move.end.col] == nil
        } else if rowMove == 2 * direction && move.start.row == startingRow {
          return board[move.end.row][move.end.col] == nil && board[move.start.row + direction][move.start.col] == nil
        }
      } else if colDiff == 1 && rowMove == direction {
        if let targetPiece = board[move.end.row][move.end.col] {
          return targetPiece.color != piece.color
        } else if let target = passant, move.end == target {
          return true
        }
      }
      
      return false
    }
  }
  
  func handleCastling(move: Move) {
    guard let king = board[move.start.row][move.start.col] else {
      print("No king found at the starting position.")
      return
    }
    
    let isKingside = move.end.col > move.start.col
    let rookStartCol = isKingside ? 7 : 0
    let rookEndCol = isKingside ? 5 : 3
    
    guard let rook = board[move.start.row][rookStartCol] else {
      print("No rook found for castling.")
      return
    }
    
    board[move.end.row][move.end.col] = king
    king.position = (move.end.row,move.end.col)
    board[move.start.row][move.start.col] = nil
    
    board[move.start.row][rookEndCol] = rook
    rook.position = (move.start.row, rookEndCol)
    board[move.start.row][rookStartCol] = nil
  }
  
  func handlePawnPromotion(move: Move) {
    guard let pawn = board[move.start.row][move.start.col] else {
      print("No pawn found at the starting position.")
      return
    }
    
    board[move.start.row][move.start.col] = nil
    
    let promotedPiece = Piece(color: pawn.color, type: .queen, position: (move.end.row,move.end.col))
    board[move.end.row][move.end.col] = promotedPiece
  }
  
  func handleEnPassant(move: Move) {
    guard let capturingPawn = board[move.start.row][move.start.col] else {
      print("No pawn found at the starting position.")
      return
    }
    
    guard let target = passant else {
      print("No en passant target available.")
      return
    }
    
    board[move.end.row][move.end.col] = capturingPawn
    capturingPawn.position = (move.end.row,move.end.col)
    board[move.start.row][move.start.col] = nil
    
    let capturedPawnRow = capturingPawn.color == .white ? move.end.row - 1 : move.end.row + 1
    board[capturedPawnRow][move.end.col] = nil
  }
  
}
