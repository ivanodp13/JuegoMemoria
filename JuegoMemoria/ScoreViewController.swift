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
        secuenceOrder.text="1"
        currentPoints.text="Puntos: 0"
        self.correctEmoji.isHidden = true
        self.failEmoji.isHidden = true
        self.replayButton.isHidden = true
        self.endLabel.isHidden = true
        
    }

    
    @IBOutlet weak var secuenceOrder: UILabel!
    @IBOutlet weak var currentPoints: UILabel!
    @IBOutlet weak var correctEmoji: UILabel!
    @IBOutlet weak var failEmoji: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var replayButton: UIButton!
    
    var currentOrder : Int = 1
    var currentClic : Int = 0
    //var currentPoints : Int = 0
    var points : Int = 0
    var endOfGame : Bool = false
    
    
    
    @IBAction func imgButton1(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    @IBAction func imgButton2(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    @IBAction func imgButton3(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    
    
    @IBAction func imgButton4(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    @IBAction func imgButton5(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    @IBAction func imgButton6(_ sender: UIButton) {
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    
    func imgActionButton(imageButton: UIImage){
        if (currentOrder<6){
            currentOrder+=1
        }
        currentClic+=1
        print ("Current Clic: ",currentClic)
        let currentOrderStr = String(currentOrder)
        secuenceOrder.text = currentOrderStr
        print ("Image: ",imageButton)
        
        if(shuffledIMG[currentClic-1]==imageButton){
            points+=1
            self.failEmoji.isHidden = true
            self.correctEmoji.isHidden = false
            let pointsText: String = ("Puntos: \(points)")
            let currentPointsStr = String(pointsText)
            currentPoints.text = currentPointsStr
        }else{
            self.failEmoji.isHidden = false
            self.correctEmoji.isHidden = true
        }
        if (currentClic==6){
            endOfGame = true
            endOfGameAction()
        }
    }
    
    func endOfGameAction(){
        if (endOfGame==true){
            self.replayButton.isHidden = false
            self.endLabel.isHidden = false
        }
    }
    
}

