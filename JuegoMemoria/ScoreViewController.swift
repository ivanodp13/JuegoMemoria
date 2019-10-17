//
//  ScoreViewController.swift
//  JuegoMemoria
//
//  Created by alumnos on 14/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var secuenceOrder: UILabel!
    var currentOrder: Int = 0
    //asignar string al label
    //secuenceOrder.text = currentOrder
    
    
    @IBAction func imgButton1(_ sender: UIButton) {
        print(sender.imageView?.image)
        currentOrder+=1
    }
    @IBAction func imgButton2(_ sender: Any) {
        print("1")
        currentOrder+=1
    }
    @IBAction func imgButton3(_ sender: Any) {
        print("2")
        currentOrder+=1
    }
    
    
    @IBAction func imgButton4(_ sender: Any) {
        print("3")
        currentOrder+=1
    }
    @IBAction func imgButton5(_ sender: Any) {
        print("4")
        currentOrder+=1
    }
    @IBAction func imgButton6(_ sender: Any) {
        print("5")
        currentOrder+=1
    }
    
}

