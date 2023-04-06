//
//  Game.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Game {
  let board: Board
  let moving: Move
  
  init() {
    board = Board()
  }
  
  func help() {
    print("-> Type 'help' for help")
    print("-> Type 'board' to see the board again")
    print("-> Type 'resign' to resign")
    print("-> Type 'moves' to list all possible moves")
    print("-> Type a square (e.g. b1, e2) to list possible moves for that square")
    print("-> Type UCI (e.g. b1c3, e7e8q) to make a move")
  }
  
  // the function does not work correctly, i ll look tomorrow
  func start() {
    var i: Int = 1
    board.display()
    print("[type 'help' for help] \(board.currentPlayer.rawValue) (\(i)):")
    if let input = readLine() {
      let letter = input.components(separatedBy: [" "])
      let piecePosition = input.split(separator: " ")
      if input=="help"{
        print(help())
      }else if input=="board"
      {
        board.display()
      }else if input=="resign"
      {
        print("Game over - \(board.currentPlayer.antiColor().rawValue) won by resignation")
        board.gameOver = true
      }else {
        if piecePosition.count == 2 {
          let start = String(piecePosition[0])
          let end = String(piecePosition[1])
        }else if piecePosition.count == 4 {
          // We should handle this part
         // board.movePiece(move)
        }
        
      }
    
    }
  }
}



