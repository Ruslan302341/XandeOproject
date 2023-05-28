//
//  ViewController.swift
//  X O
//
//  Created by admin on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1
    
    var stste = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winState = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        if stste[sender.tag - 1] != 0 {
            return
        }
        stste [sender.tag - 1] = player
        count += 1
        if player == 1 {
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
            player = 1
        }
        
        for winArray in winState {
            if stste[winArray[0]] == stste [winArray[1]] && stste[winArray[1]] == stste[winArray[2]] {
                if stste[winArray[0]] == 1 {
                    print("x win")
                    
                    let alert = UIAlertController(title: "x win!", message: "x win!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in }))
                    
                    present (alert, animated: true, completion: nil)
                    return
                }
                if stste[winArray[0]] == 2 {
                    print("o win")
                    
                    let alert = UIAlertController(title: "o win!", message: "o win!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in }))
                    self.clear()
                    
                    present (alert, animated: true, completion: nil)
                    return
                }
            }
        }
    }
    
    func clear () {
        player = 1
        
        count = 0
        
        for i in 0...8 {
            stste[i] = 0
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
        }
        if count == 9 {
            let alert = UIAlertController(title: "o win!", message: "o win!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in }))
            self.clear()
            
            present (alert, animated: true, completion: nil)
        }
        
    }
}

