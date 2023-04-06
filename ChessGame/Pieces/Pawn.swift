//
//  Pawn.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Pawn: Piece {
  
  var hasMoved: Bool = false
  
  override init(color: Color, type: PieceType, position: (Int, Int)) {
    super.init(color: color, type: .pawn, position: position)
  }
  
}
