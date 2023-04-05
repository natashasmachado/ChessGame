//
//  PieceType.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class King: Piece {
  
  override init(color: Color, type: PieceType) {
    super.init(color: color, type: .king)
  }
  
  override func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    let rowDiff = abs(end.row - start.row)
    let colDiff = abs(end.col - start.col)
    return rowDiff <= 1 && colDiff <= 1
  }
}
