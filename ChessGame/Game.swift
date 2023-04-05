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
  //  while !gameOver {
  //    var i: Int = 1
  //    print("\n [type 'help' for help] \(board.currentPlayer.rawValue) \(i):")
  //    var validMove = false
  //    while !validMove {
  //      let input = readLine()!
  //      let move = parseMove(input: input)
  //      if move == nil {
  //        print("Invalid input.")
  //      } else if !board.movePiece(from: move!.from, to: move!.to) {
  //        print("Invalid move.")
  //      } else {
  //        validMove = true
  //      }
  //    }
  //    board.display()
  //  }
  //  print("\(board.currentPlayer.antiColor().rawValue) wins!")
      if board.whiteKing == nil {
          //Game over, Black wins
          print("Game over - Black won!")
          board.gameOver = true
          return
      }
      if board.blackKing == nil {
          //Game over, White wins
          print("Game over - White won!")
          board.gameOver = true
          return
      }
  }
  
}

