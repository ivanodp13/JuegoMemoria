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
    }
    
    //meter imagenes en array
    var imageArray: [UIImage] = [
        #imageLiteral(resourceName: "img4"),
        #imageLiteral(resourceName: "img1"),
        #imageLiteral(resourceName: "img3"),
        #imageLiteral(resourceName: "img2"),
        #imageLiteral(resourceName: "img5"),
        #imageLiteral(resourceName: "img6")
    ]


    @IBOutlet weak var textoIntro: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var picsSecuence: UIImageView!
    @IBAction func StartButton(_ sender: Any) {
        self.StartButton.isHidden = true
        self.picsSecuence.isHidden = false
        self.textoIntro.isHidden = true
        imageSecuence()
    }
    
    func imageSecuence() {
        
        //orden aleatorio elemntos array
        imageArray.shuffle()
        let shuffledIMG = imageArray.shuffled()
        
        picsSecuence.image = shuffledIMG[0]
        
        var seconds: Double = 0
        for i in 1...5 {
            print(i)
            seconds+=1
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                //self.picsSecuence.image = shuffledIMG[i]
                let j = i
                print ("j: ", j)
                self.picsSecuence.image = self.imageArray[j]
            }
        }
        
    }
}
