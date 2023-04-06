//
//  PieceType.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class King: Piece {
  
  override init(color: Color, type: PieceType, position: (Int, Int)) {
    super.init(color: color, type: .king, position: position)
  }
  
}
