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
    
    //Array de imagenes a mezclar
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
    @IBOutlet weak var StackViewMain: UIStackView!
    
    //Boton de inicio del juego
    @IBAction func StartButton(_ sender: Any) {
        self.picsSecuence.isHidden = false
        self.StackViewMain.isHidden = true
        imageSecuence()
    }
    
    //Slider de selección de dificultad
    @IBAction func levelSliderAction(_ sender: UISlider) {
        let myIntValue = Int(sender.value)
        
        levels = myIntValue
        
        //Niveles, contiene el nombre del nivel y la velocidad a la que se mostrarán las imagenes
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
        
        // Muestra el texto con el nivel seleccionado
        let levelStr = String(level)
        showValueSlider.text = levelStr
        
    }
    
    //Función que inicia el juego
    func imageSecuence() {
        
        //Mezcla el array de imagenes con un orden aleatorio
        imageArray.shuffle()
        shuffledIMG = imageArray.shuffled()
        
        
        var seconds: Double = 0
        
        //Bucle que recorre el array de imagenes para mostrarlas
        for i in 0...5 {
            print(i)
            seconds+=secodsToAdvance
            //Añade el codigo que contiene a una cola
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                let j = i
                print ("j: ", j)
                //Muestra la imagen en el imageView
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
