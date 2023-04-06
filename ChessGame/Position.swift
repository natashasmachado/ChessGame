//
//  Position.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

struct Position {
  let row: Int
  let col: Int
}

extension Position: Equatable {
  static func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.row == rhs.row && lhs.col == rhs.col
  }
}
