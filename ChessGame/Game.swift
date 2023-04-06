//
//  Game.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

class Game {
  let board: Board
  var currentPlayer: Color = .white
  var i: Int = 1
  
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
  
  func parseInput(_ input: String) -> (start: Position, end: Position)? {
    guard input.count == 4 else { return nil }
    
    let inputArray = Array(input)
    
    let colStart = Int(inputArray[0].asciiValue! - Character("a").asciiValue!)
    let rowStart = Int(inputArray[1].asciiValue! - Character("1").asciiValue!)
    let colEnd = Int(inputArray[2].asciiValue! - Character("a").asciiValue!)
    let rowEnd = Int(inputArray[3].asciiValue! - Character("1").asciiValue!)
    
    let startPosition = Position(row: rowStart, col: colStart)
    let endPosition = Position(row: rowEnd, col: colEnd)
    
    return (start: startPosition, end: endPosition)
  }
  
  func start() {
    while board.gameOver != true {
      board.display()
      print("[type 'help' for help] \(currentPlayer.rawValue) (\(i)):")
      if let input=readLine() {
        if input=="help"{
          print(help())
        }else if input=="board"
        {
          board.display()
        }else if input=="resign"
        {
          print("Game over - \(currentPlayer.antiColor().rawValue) won by resignation")
          board.gameOver = true
        }else {
          if let positions = parseInput(input) {
            let start = positions.start
            let end = positions.end
            let moving = Move(start: start, end: end,player: currentPlayer)
            board.movePiece(move: moving)
            i=i+1
            currentPlayer = currentPlayer.antiColor()
          }
          
        }
      }
    }
    board.display()
  }
}




