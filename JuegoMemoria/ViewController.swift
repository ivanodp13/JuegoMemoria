//
//  ViewController.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showValueSlider.text="Normal"
    }
    
    var levelNumber: Int = 0
    var level: String = ""
    var levels : Int = 0
    var secodsToAdvance: Double = 1
    
    //meter imagenes en array
    var imageArray: [UIImage] = [
        #imageLiteral(resourceName: "img4"),
        #imageLiteral(resourceName: "img1"),
        #imageLiteral(resourceName: "img3"),
        #imageLiteral(resourceName: "img2"),
        #imageLiteral(resourceName: "img5"),
        #imageLiteral(resourceName: "img6")
    ]

    
    @IBOutlet weak var showValueSlider: UILabel!
    @IBOutlet weak var textoIntro: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var picsSecuence: UIImageView!
    @IBAction func StartButton(_ sender: Any) {
        self.StartButton.isHidden = true
        self.levelLabel.isHidden = true
        self.picsSecuence.isHidden = false
        self.textoIntro.isHidden = true
        self.levelSlider.isHidden = true
        self.showValueSlider.isHidden = true
        imageSecuence()
    }
    

    @IBAction func levelSliderAction(_ sender: UISlider) {
        //print(sender)
        let myIntValue = Int(sender.value)
        
        levels = myIntValue
        
        switch levels {
            case 0:
                level="Fácil"
                secodsToAdvance=2
            case 1:
                level="Normal"
                secodsToAdvance=1
            case 2:
                level="Difícil"
                secodsToAdvance=0.5
            default:
                level="Normal"
                secodsToAdvance=1
        }
        
        let levelStr = String(level)
         showValueSlider.text = levelStr
        
    }
    
    func imageSecuence() {
        
        //orden aleatorio elemntos array
        imageArray.shuffle()
        shuffledIMG = imageArray.shuffled()
        
        //picsSecuence.image = shuffledIMG[0]
        
        var seconds: Double = 0
        //let secodsToAdvance: Double = 1
        for i in 0...5 {
            print(i)
            seconds+=secodsToAdvance
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                //self.picsSecuence.image = shuffledIMG[i]
                let j = i
                print ("j: ", j)
                self.picsSecuence.image = shuffledIMG[j]
                if (j==5){
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.secodsToAdvance) {
                        self.performSegue(withIdentifier: "enterScoreView", sender: nil)
                    }
                }
            }
        }
        
    }
}
