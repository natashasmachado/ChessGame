//
//  Position.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

struct Position {
  let row: Int
  let column: Int
  
  init(_ row: Int, _ column: Int) {
    self.row = row
    self.column = column
  }
}
