//
//  Piece.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Piece {
  
  let color: Color
  let type: PieceType
  
  init(color: Color, type: PieceType) {
    self.color = color
    self.type = type
  }
  
  func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    return false
  }
  
}
