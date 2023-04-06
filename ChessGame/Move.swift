//
//  Move.swift
//  ChessGame
//
//  Created by Helin Akın on 5.04.2023.
//

import Foundation

struct Move {
  let start: Position
  let end: Position
  let player: Color
  
  init(start: Position, end: Position, player: Color) {
    self.start = start
    self.end = end
    self.player = player
  }
}

