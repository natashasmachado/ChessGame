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
  var position: (Int, Int)
  
    init(color: Color, type: PieceType, position: (Int,Int)) {
    self.color = color
    self.type = type
    self.position = position
  }
  
  func canMove(from start: Position, to end: Position, board: [[Piece?]]) -> Bool {
    return false
  }
  
    func getMoves() -> [(y: Int, x: Int)] {
        var moves: [(Int, Int)] = []
        
        return moves
    }
}
