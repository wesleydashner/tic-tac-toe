//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Wesley Dashner on 10/2/18.
//  Copyright © 2018 Wesley Dashner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var matrix = [[0, 0, 0],
                  [0, 0, 0],
                  [0, 0, 0]]
    
    var player_win = false
    var ai_win = false
    var draw = false
    
    func UpdateBoard() {
        if matrix[0][0] == 0 {
            x_1.isHidden = true
            o_1.isHidden = true
        }
        else if matrix[0][0] == 1 {
            x_1.isHidden = false
            o_1.isHidden = true
        }
        else if matrix[0][0] == 2  {
            x_1.isHidden = true
            o_1.isHidden = false
        }
        if matrix[0][1] == 0 {
            x_2.isHidden = true
            o_2.isHidden = true
        }
        else if matrix[0][1] == 1 {
            x_2.isHidden = false
            o_2.isHidden = true
        }
        else if matrix[0][1] == 2  {
            x_2.isHidden = true
            o_2.isHidden = false
        }
        if matrix[0][2] == 0 {
            x_3.isHidden = true
            o_3.isHidden = true
        }
        else if matrix[0][2] == 1 {
            x_3.isHidden = false
            o_3.isHidden = true
        }
        else if matrix[0][2] == 2  {
            x_3.isHidden = true
            o_3.isHidden = false
        }
        if matrix[1][0] == 0 {
            x_4.isHidden = true
            o_4.isHidden = true
        }
        else if matrix[1][0] == 1 {
            x_4.isHidden = false
            o_4.isHidden = true
        }
        else if matrix[1][0] == 2  {
            x_4.isHidden = true
            o_4.isHidden = false
        }
        if matrix[1][1] == 0 {
            x_5.isHidden = true
            o_5.isHidden = true
        }
        else if matrix[1][1] == 1 {
            x_5.isHidden = false
            o_5.isHidden = true
        }
        else if matrix[1][1] == 2  {
            x_5.isHidden = true
            o_5.isHidden = false
        }
        if matrix[1][2] == 0 {
            x_6.isHidden = true
            o_6.isHidden = true
        }
        else if matrix[1][2] == 1 {
            x_6.isHidden = false
            o_6.isHidden = true
        }
        else if matrix[1][2] == 2  {
            x_6.isHidden = true
            o_6.isHidden = false
        }
        if matrix[2][0] == 0 {
            x_7.isHidden = true
            o_7.isHidden = true
        }
        else if matrix[2][0] == 1 {
            x_7.isHidden = false
            o_7.isHidden = true
        }
        else if matrix[2][0] == 2  {
            x_7.isHidden = true
            o_7.isHidden = false
        }
        if matrix[2][1] == 0 {
            x_8.isHidden = true
            o_8.isHidden = true
        }
        else if matrix[2][1] == 1 {
            x_8.isHidden = false
            o_8.isHidden = true
        }
        else if matrix[2][1] == 2  {
            x_8.isHidden = true
            o_8.isHidden = false
        }
        if matrix[2][2] == 0 {
            x_9.isHidden = true
            o_9.isHidden = true
        }
        else if matrix[2][2] == 1 {
            x_9.isHidden = false
            o_9.isHidden = true
        }
        else if matrix[2][2] == 2  {
            x_9.isHidden = true
            o_9.isHidden = false
        }
    }
    
    func TestWin() {
        for i in [1, 2] {
            for index in [0, 1, 2] {
                if matrix[0][index] == i && matrix[1][index] == i && matrix[2][index] == i {
                    if i == 1 {
                        player_win = true
                    }
                    else if i == 2 {
                        ai_win = true
                    }
                }
            }
            for index in [0, 1, 2] {
                if matrix[index][0] == i && matrix[index][1] == i && matrix[index][2] == i {
                    if i == 1 {
                        player_win = true
                    }
                    else if i == 2 {
                        ai_win = true
                    }
                }
            }
            if matrix[0][0] == i && matrix[1][1] == i && matrix[2][2] == i {
                if i == 1 {
                    player_win = true
                }
                else if i == 2 {
                    ai_win = true
                }
            }
            if matrix[0][2] == i && matrix[1][1] == i && matrix[2][0] == i {
                if i == 1 {
                    player_win = true
                }
                else if i == 2 {
                    ai_win = true
                }
            }
        }
        
        var counter = 0
        for i in [0, 1, 2] {
            for index in [0, 1, 2] {
                if matrix[i][index] != 0 {
                    counter += 1
                }
            }
        }
        if counter == 9 {
            draw = true
        }
    }

    func AITurn() {
        if player_win == false && ai_win == false {
            
            // self win
            for i in [0, 1 ,2] {
                for index in [0, 1, 2] {
                    if matrix[i][index] == 0 {
                        matrix[i][index] = 2
                        TestWin()
                        if ai_win == true {
                            return
                        }
                        else {
                            matrix[i][index] = 0
                        }
                    }
                }
            }
            
            // player win
            for i in [0, 1 ,2] {
                for index in [0, 1, 2] {
                    if matrix[i][index] == 0 {
                        matrix[i][index] = 1
                        TestWin()
                        if player_win == true {
                            matrix[i][index] = 2
                            player_win = false
                            return
                        }
                        else {
                            matrix[i][index] = 0
                            player_win = false
                        }
                    }
                }
            }
            
            // corners
            var available_corners: Array<Int> = []
            if matrix[0][0] == 0 {
                available_corners.append(1)
            }
            if matrix[0][2] == 0 {
                available_corners.append(3)
            }
            if matrix[2][0] == 0 {
                available_corners.append(7)
            }
            if matrix[2][2] == 0 {
                available_corners.append(9)
            }
            if let corner_choice = available_corners.randomElement() {
                if corner_choice == 1 {
                    matrix[0][0] = 2
                    return
                }
                if corner_choice == 3 {
                    matrix[0][2] = 2
                    return
                }
                if corner_choice == 7 {
                    matrix[2][0] = 2
                    return
                }
                if corner_choice == 9 {
                    matrix[2][2] = 2
                    return
                }
            }
            
            // center
            if matrix[1][1] == 0 {
                matrix[1][1] = 2
                return
            }
            
            // sides
            var available_sides: Array<Int> = []
            if matrix[0][1] == 0 {
                available_sides.append(2)
            }
            if matrix[1][0] == 0 {
                available_sides.append(4)
            }
            if matrix[1][2] == 0 {
                available_sides.append(6)
            }
            if matrix[2][1] == 0 {
                available_sides.append(8)
            }
            if let side_choice = available_sides.randomElement() {
                if side_choice == 2 {
                    matrix[0][1] = 2
                    return
                }
                if side_choice == 4 {
                    matrix[1][0] = 2
                    return
                }
                if side_choice == 6 {
                    matrix[1][2] = 2
                    return
                }
                if side_choice == 8 {
                    matrix[2][1] = 2
                    return
                }
            }
        }
    }
    
    func ShowResultLabel() {
        if player_win {
            player_wins_label.isHidden = false
        }
        else if ai_win {
            ai_wins_label.isHidden = false
        }
        else if draw {
            draw_label.isHidden = false
        }
    }
    
    func RestartGame() {
        player_win = false
        ai_win = false
        draw = false
        player_wins_label.isHidden = true
        ai_wins_label.isHidden = true
        draw_label.isHidden = true
        matrix = [[0, 0, 0],
                  [0, 0, 0],
                  [0, 0, 0]]
        UpdateBoard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateBoard()
        player_wins_label.isHidden = true
        ai_wins_label.isHidden = true
        draw_label.isHidden = true
    }

    @IBOutlet weak var o_1: UIImageView!
    @IBOutlet weak var x_1: UIImageView!
    @IBOutlet weak var o_2: UIImageView!
    @IBOutlet weak var x_2: UIImageView!
    @IBOutlet weak var o_3: UIImageView!
    @IBOutlet weak var x_3: UIImageView!
    @IBOutlet weak var o_4: UIImageView!
    @IBOutlet weak var x_4: UIImageView!
    @IBOutlet weak var o_5: UIImageView!
    @IBOutlet weak var x_5: UIImageView!
    @IBOutlet weak var o_6: UIImageView!
    @IBOutlet weak var x_6: UIImageView!
    @IBOutlet weak var o_7: UIImageView!
    @IBOutlet weak var x_7: UIImageView!
    @IBOutlet weak var o_8: UIImageView!
    @IBOutlet weak var x_8: UIImageView!
    @IBOutlet weak var o_9: UIImageView!
    @IBOutlet weak var x_9: UIImageView!
    @IBOutlet weak var player_wins_label: UILabel!
    @IBOutlet weak var ai_wins_label: UILabel!
    @IBOutlet weak var draw_label: UILabel!
    
    func MainButton(x: Int, y: Int) {
        if player_win == false && ai_win == false && draw == false {
            if matrix[x][y] == 0 {
                matrix[x][y] = 1
                UpdateBoard()
                TestWin()
                AITurn()
                UpdateBoard()
                ShowResultLabel()
            }
        }
        else {
            RestartGame()
        }
    }
    
    @IBAction func button_1(_ sender: UIButton) {
        MainButton(x: 0, y: 0)
    }
    @IBAction func button_2(_ sender: UIButton) {
        MainButton(x: 0, y: 1)
    }
    @IBAction func button_3(_ sender: UIButton) {
        MainButton(x: 0, y: 2)
    }
    @IBAction func button_4(_ sender: UIButton) {
        MainButton(x: 1, y: 0)
    }
    @IBAction func button_5(_ sender: UIButton) {
        MainButton(x: 1, y: 1)
    }
    @IBAction func button_6(_ sender: UIButton) {
        MainButton(x: 1, y: 2)
    }
    @IBAction func button_7(_ sender: UIButton) {
        MainButton(x: 2, y: 0)
    }
    @IBAction func button_8(_ sender: UIButton) {
        MainButton(x: 2, y: 1)
    }
    @IBAction func button_9(_ sender: UIButton) {
        MainButton(x: 2, y: 2)
    }
}
