
import Foundation
import SwiftUI


class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.cross
    @Published var noughtScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"

    
    init()
    {
        resetBoard()
    }
    
    func turnText() -> String
    {
        return turn == Tile.cross ? "Turn: X" : "Turn: O"
    }
    
    
    func placeTile(_ row: Int, _ column: Int)
    {
        if (board[row][column].tile != Tile.empty)
        {
            return
        }
        board[row][column].tile = turn == Tile.cross ? Tile.cross : Tile.nought
        
        if (checkForVictory())
        {
            if (turn == Tile.cross)
            {
                crossesScore += 1
            }
            else
            {
                noughtScore += 1
            }
            let winner = turn == Tile.cross ? "Crosses" : "Noughts"
            alertMessage = winner + " Win!"
            showAlert = true
        }
        else
        {
            turn = turn == Tile.cross ? Tile.nought : Tile.cross
        }
        if (checkForDraw())
        {
            alertMessage = "Draw!"
            showAlert = true
        }
    }
   
    
    func checkForDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.empty
                {
                    return false
                }
            }
        }
                
        return true;
    }
    
    func checkForVictory() -> Bool
    {
        //vertical victories
        if (isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0))
        {
            return true;
        }
        if (isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1))
        {
            return true;
        }
        if (isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2))
        {
            return true;
        }
        
        //horizontal victories
        if (isTurnTile(0, 1) && isTurnTile(0, 2) && isTurnTile(0, 3))
        {
            return true;
        }
        if (isTurnTile(1, 1) && isTurnTile(1, 2) && isTurnTile(1, 3))
        {
            return true;
        }
        if (isTurnTile(2, 1) && isTurnTile(2, 2) && isTurnTile(2, 3))
        {
            return true;
        }
        
        //diagnal victories
        if (isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2))
        {
            return true;
        }
        if (isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0))
        {
            return true;
        }
        
        return false;
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool
    {
        return board[row][column].tile == turn
    }
    
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.empty))
               
            }
            newBoard.append(row)
        }
        board = newBoard
                
    }
    
   
}
