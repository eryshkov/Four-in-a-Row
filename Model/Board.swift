//
//  Board.swift
//  Four in a Row
//
//  Created by Evgeniy Ryshkov on 08/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

enum ChipColor: Int {
    case none = 0
    case red
    case black
}

class Board: NSObject {
    //MARK: -
    static var width = 7
    static var height = 6
    
    var slots = [ChipColor]()
    var currentPlayer: Player
    
    //MARK: -
    func isFull() -> Bool {
        return false
    }
    
    func isWin(for player: Player) -> Bool {
        return false
    }
    
    func chip(inColumn column: Int, row: Int) -> ChipColor {
        return slots[row + column * Board.height]
    }
    
    func add(chip: ChipColor, in column: Int) {
        if let row = nextEmptySlot(in: column) {
            set(chip: chip, in: column, row: row)
        }
    }
    
    func set(chip: ChipColor, in colunm: Int, row: Int) {
        slots[row + colunm * Board.height] = chip
    }
    
    func nextEmptySlot (in column: Int) -> Int? {
        for row in 0 ..< Board.height {
            if chip(inColumn: column, row: row) == .none {
                return row
            }
        }
        
        return nil
    }
    
    func canMove(in column: Int) -> Bool {
        return nextEmptySlot(in: column) != nil
    }
    
    //MARK: -
    override init() {
        currentPlayer = Player.allPlayers[0]
        for _ in 0 ..< Board.width * Board.height {
            slots.append(.none)
        }
        
        super.init()
    }
}
