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
        currentStreakLabel.text="Racha: 0"
        currentEmoji.text=""
        self.replayButton.isHidden = true
        self.endLabel.isHidden = true
        currentStreakLabel.isHidden = true
        
    }

    
    @IBOutlet weak var secuenceOrder: UILabel!
    @IBOutlet weak var currentPoints: UILabel!
    @IBOutlet weak var currentEmoji: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var currentStreakLabel: UILabel!
    
    var currentOrder : Int = 1
    var currentClic : Int = 0
    var points : Int = 0
    var endOfGame : Bool = false
    var consecutive : Int = 0
    var isRight : Bool = false
    var consecutiveCount: Int = 0
    var streakPoints: Int = 0
    
    //Funcion al pulsar el boton 1
    @IBAction func imgButton1(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el boton
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    //Funcion al pulsar el boton 2
    @IBAction func imgButton2(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el botón
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    //Funcion al pulsar el boton 3
    @IBAction func imgButton3(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el botón
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    
    
    //Funcion al pulsar el boton 4
    @IBAction func imgButton4(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el botón
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    //Funcion al pulsar el boton 5
    @IBAction func imgButton5(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el botón
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    //Funcion al pulsar el boton 6
    @IBAction func imgButton6(_ sender: UIButton) {
        //Introduce en la variable la imagen que contiene el botón
        let buttonImg: UIImage = (sender.imageView?.image!)!
        if (endOfGame==false){
            imgActionButton(imageButton: buttonImg)
        }
    }
    
    //Comprobación de las imagenes
    func imgActionButton(imageButton: UIImage){
        //Controla la posición del array que se va a comparar
        if (currentOrder<6){
            currentOrder+=1
        }
        //Controla el numero de intentos (clics) realizados
        currentClic+=1
        print ("Current Clic: ",currentClic)
        let currentOrderStr = String(currentOrder)
        secuenceOrder.text = currentOrderStr
        print ("Image: ",imageButton)
        
        //Botón pulsado en el orden correcto
        if(shuffledIMG[currentClic-1]==imageButton){
            points+=1
            
            //Muestra que has acertado
            let emoji: String = ("👍")
            let currentEmojiStr = String(emoji)
            currentEmoji.text = currentEmojiStr
            isRight=true
            consecutive+=1
        
            //Muestra los puntos actuales
            let pointsText: String = ("Puntos: \(points)")
            let currentPointsStr = String(pointsText)
            currentPoints.text = currentPointsStr
            
            streak()
        }else{
            //Muestra que has fallado
            let emoji: String = ("👎")
            let currentEmojiStr = String(emoji)
            currentEmoji.text = currentEmojiStr
            
            isRight=false

            consecutive=0
            
            streak()
        }
        //Comprueba si has llegado al fin del juego
        if (currentClic==6){
            endOfGame = true
            endOfGameAction()
        }
    }
    
    //En caso de fin del juego
    func endOfGameAction(){
        if (endOfGame==true){
            self.replayButton.isHidden = false
            self.endLabel.isHidden = false
            self.secuenceOrder.isHidden = true
            
            currentStreakLabel.isHidden = false
            let streakText: String = ("Puntos extras por rachas: \(streakPoints)")
            let currentStreakStr = String(streakText)
            currentStreakLabel.text = currentStreakStr
        }
    }
    
    //Rachas
    func streak(){
        if (isRight==true){
            //Si aciertas 2 consecutivas te suma un punto extra
            if (consecutive == 2){
                points+=1
                streakPoints+=1
                consecutive=1
                let pointsText: String = ("Puntos: \(points)")
                let currentPointsStr = String(pointsText)
                currentPoints.text = currentPointsStr
                
                consecutiveCount+=1
                
                //Muestra si estás en racha, y cuantas consecutivas
                currentStreakLabel.isHidden = false
                let streakText: String = ("Racha: \(consecutiveCount)")
                let currentStreakStr = String(streakText)
                currentStreakLabel.text = currentStreakStr
            }
        }else{
            currentStreakLabel.isHidden = true
            consecutiveCount=0
        }
        
    }
    
}

