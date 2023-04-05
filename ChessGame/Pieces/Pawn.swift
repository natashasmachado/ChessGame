//
//  Pawn.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Pawn: Piece {
  
  var hasMoved: Bool = false
  
  override init(color: Color, type: PieceType) {
    super.init(color: color, type: .pawn)
  }
  
  override func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    let rowDiff = end.row - start.row
    let colDiff = abs(end.col - start.col)
    
    if color == .white {
      if rowDiff == -1 && colDiff == 0 && board[end.row][end.col] == nil {
        return true
      } else if !hasMoved && rowDiff == -2 && colDiff == 0 && board[end.row][end.col] == nil && board[end.row + 1][end.col] == nil {
        return true
      } else if rowDiff == -1 && colDiff == 1 && board[end.row][end.col] != nil && board[end.row][end.col]?.color == .black {
        return true
      } else if rowDiff == -1 && colDiff == 0 && board[end.row][end.col] != nil {
        return false
      } else {
        return false
      }
    } else {
      if rowDiff == 1 && colDiff == 0 && board[end.row][end.col] == nil {
        return true
      } else if !hasMoved && rowDiff == 2 && colDiff == 0 && board[end.row][end.col] == nil && board[end.row - 1][end.col] == nil {
        return true
      } else if rowDiff == 1 && colDiff == 1 && board[end.row][end.col] != nil && board[end.row][end.col]?.color == .white {
        return true
      } else if rowDiff == 1 && colDiff == 0 && board[end.row][end.col] != nil {
        return false
      } else {
        return false
      }
    }
  }
}
