//
//  ViewController.swift
//  DiceeApp
//
//  Created by Арсен Абдухалық on 22.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeftDiceeImageView: UIImageView!
    @IBOutlet weak var RightDiceeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LeftDiceeImageView.image = UIImage(named: "DiceSix")
        RightDiceeImageView.image = UIImage(named: "DiceSix")
    }
    
    override var canBecomeFirstResponder: Bool { true }
    
    override func viewDidAppear(_ animated: Bool) {
        becomeFirstResponder()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDicee()
        }
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDicee()
    }
    
    func rollDicee() {
        let leftNumber = Int.random(in: 1...6)
        let RightNumber = Int.random(in: 1...6)
        
        switch leftNumber {
        case 1 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceOne")
        case 2 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceTwo")
        case 3 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceThree")
        case 4 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceFour")
        case 5 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceFive")
        case 6 :
            self.LeftDiceeImageView.image = UIImage(named: "DiceSix")
        default :
            break
        }
        switch RightNumber {
        case 1 :
            self.RightDiceeImageView.image = UIImage(named: "DiceOne")
        case 2 :
            self.RightDiceeImageView.image = UIImage(named: "DiceTwo")
        case 3 :
            self.RightDiceeImageView.image = UIImage(named: "DiceThree")
        case 4 :
            self.RightDiceeImageView.image = UIImage(named: "DiceFour")
        case 5 :
            self.RightDiceeImageView.image = UIImage(named: "DiceFive")
        case 6 :
            self.RightDiceeImageView.image = UIImage(named: "DiceSix")
        default :
            break
        }
        
    }
}

