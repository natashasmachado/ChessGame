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
  // the function does not work correctly, i ll look tomorrow
  func start() {
    board.display()
    menuSelect()
    while !gameOver {
      var i: Int = 1
      print("\n [type 'help' for help] \(board.currentPlayer.rawValue) \(i):")
      var validMove = false
      while !validMove {
        let input = readLine()!
        let move = parseMove(input: input)
        if move == nil {
          print("Invalid input.")
        } else if !board.movePiece(from: move!.from, to: move!.to) {
          print("Invalid move.")
        } else {
          validMove = true
        }
      }
      board.display()
    }
    print("\(board.currentPlayer.antiColor().rawValue) wins!")
  }
  
  func menuSelect() {
    print("\n [type 'help' for help] White (1)")
    print("* type 'help' for help")
    print("* type 'board' to see the board again")
    print("* type 'resign' to resign")
    print("* type 'moves' to list all possible moves")
    print("* type a square (e.g. b1, e2) to list possible moves for that square")
    print("* type UCI (e.g. b1c3, e7e8q) to make a move")
  }
}

