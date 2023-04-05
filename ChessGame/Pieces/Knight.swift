//
//  Knight.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Knight: Piece {
  
  override init(color: Color, type: PieceType, position: (Int, Int)) {
    super.init(color: color, type: .knight, position: position)
  }
  
  override func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    let rowDiff = abs(end.row - start.row)
    let colDiff = abs(end.col - start.col)
    return (rowDiff == 2 && colDiff == 1) || (rowDiff == 1 && colDiff == 2)
  }
}
