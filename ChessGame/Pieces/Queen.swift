//
//  Queen.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Queen: Piece {
  
  init(color: Color) {
    super.init(color: color, symbol: color == .white ? "♕" : "♛", type: .queen)
  }
  
  override func move(from start: Position, to end: Position, board: Board) -> Bool {
    return false
  }
}
