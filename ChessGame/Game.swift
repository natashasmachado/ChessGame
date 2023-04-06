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
        }else if input == "moves" {
            let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
            var moves: [String] = []
            for j in 0..<8 {
                for k in 0..<8 {
                    if let piece = board.board[j][k]{
                        if piece.color == currentPlayer {
                            var counter = 0
                            var temp = "\(letters[k])\(j + 1) - {"
                            for l in 0..<8 {
                                for m in 0..<8 {
                                    if board.isMoveValid(piece: piece, move: Move(start: Position(row: j, col: k), end: Position(row: l, col: m), player: currentPlayer)) {
                                        if counter > 0 {
                                            temp.append(", ")
                                        }
                                        temp.append("\(letters[l])\(m + 1)")
                                        counter += 1
                                    }
                                }
                            }
                            temp.append("}")
                            moves.append(temp)
                        }
                    }
                }
            }
            for move in moves {
                print(move)
            }
        } else if input.count == 2 {
            let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
            var temp = 0
            for letter in 0..<letters.count {
                if input.prefix(1) == letters[letter] {
                    temp = letter
                    break
                }
            }
            
            
            
            if let piece = board.board[Int(input.suffix(1))!][temp] {
                print(getMoves(piece))
            }
        }
          else {
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
    
    func getMoves(_ piece: Piece) -> String {
        var counter = 0
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
        var temp = "\(letters[piece.position.0])\(piece.position.1 + 1) - {"
        for l in 0..<8 {
            for m in 0..<8 {
                if board.isMoveValid(piece: piece, move: Move(start: Position(row: piece.position.0, col: piece.position.1), end: Position(row: l, col: m), player: currentPlayer)) {
                    if counter > 0 {
                        temp.append(", ")
                    }
                    temp.append("\(letters[l])\(m + 1)")
                    counter += 1
                }
                    temp.append("}")
            }
        }
        return temp
    }
}



