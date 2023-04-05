//
//  Piece.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Piece {
  
  let color: Color
  let symbol: String
  let type: PieceType
  
  init(color: Color, symbol: String, type: PieceType) {
    self.color = color
    self.symbol = symbol
    self.type = type
  }
  
  func move(from start: Position, to end: Position, board: Board) -> Bool {
    return false
  }
  
}
