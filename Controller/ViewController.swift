//
//  ViewController.swift
//  Four in a Row
//
//  Created by Evgeniy Ryshkov on 08/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -
    @IBOutlet var columnButtons: [UIButton]!
    
    //MARK: -
    var placedChips = [[UIView]]()
    var board: Board!
    
    //MARK: -
    func resetBoard() {
        board = Board()
        
        for i in 0 ..< placedChips.count {
            for chip in placedChips[i] {
                chip.removeFromSuperview()
            }
            
            placedChips[i].removeAll(keepingCapacity: true)
        }
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< Board.width {
            placedChips.append([UIView]())
        }
        
        resetBoard()
    }

    //MARK: -
    @IBAction func makeMove(_ sender: UIButton) {
    }
    
}

