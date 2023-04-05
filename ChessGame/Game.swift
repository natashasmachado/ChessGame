//
//  Game.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Game {
  let board: Board
  
  init() {
    board = Board()
  }
  
  func start() {
    board.display()
  }
}

