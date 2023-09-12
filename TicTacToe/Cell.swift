//
//  Cell.swift
//  TicTacToe
//
//  Created by Joshua Cheng on 9/12/23.
//

import Foundation
import SwiftUI

struct Cell
{
    var tile: Tile
    func displayTile() -> String
    {
        switch(tile)
        {
            
            case Tile.nought:
                return "O"
            case Tile.cross:
                return "X"
            default:
                return ""
            
        }
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
            
            case Tile.nought:
            return Color.red
            case Tile.cross:
            return Color.black
            default:
            return Color.black
            
            
        }
    }
    
    
    
    
}
enum Tile
{
    case nought
    case cross
    case empty
}
