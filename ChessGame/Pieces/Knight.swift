//
//  Knight.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Knight: Piece {
  
  init(color: Color) {
    super.init(color: color, symbol: color == .white ? "♘" : "♞", type: .knight)
  }
  
  override func move(from start: Position, to end: Position, board: Board) -> Bool {
    return false
  }
}
