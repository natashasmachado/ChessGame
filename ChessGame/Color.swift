//
//  PieceColor.swift
//  ChessGame
//
//  Created by Dogus Guleryuz on 03.04.2023.
//

import Foundation

enum Color: String {
  case white = "White"
  case black = "Black"
  
  func antiColor() -> Color {
    return self == .white ? .black : .white
  }
  
}
