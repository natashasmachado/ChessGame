//
//  Rook.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Rook: Piece {
  
  override init(color: Color, type: PieceType, position: (Int, Int)) {
    super.init(color: color, type: .rook, position: position)
  }
  
  override func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    let rowDiff = abs(end.row - start.row)
    let colDiff = abs(end.col - start.col)
    return (rowDiff == 0) || (colDiff == 0)
  }
}
