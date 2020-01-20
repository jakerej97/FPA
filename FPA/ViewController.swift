//
//  ViewController.swift
//  FPA
//
//  Created by Jake Rejwan on 1/17/20.
//  Copyright © 2020 Jake Rejwan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var Hint: UILabel!
    @IBOutlet weak var GuessNumber: UILabel!
    @IBOutlet weak var SubmitButton: UIButton!
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var key: String?
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("users")
        generateRandomNumber()
        getKey()
        
    }
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    func getKey() {
        key = ref.childByAutoId().key
    }
    
    func addUser() {
        let user = ["id": key!,
                    "correctNumber": TextField.text!,
                    "guesses": String(numberOfGuesses)]
        
        ref.child(key!).setValue(user)
        
    }
    
    @IBAction func Button1(_ sender: Any) {
        if TextField.text != "" {
            numberOfGuesses += 1
            if Int(TextField.text!) == numberToGuess {
                print("You Win!")
                Hint.text = "You Win!"
                addUser()
            } else {
                let guess = Int(TextField.text!)
                if guess! < lowerBound || guess! > upperBound {
                    print("Your guess should be between 1 and 100!")
                } else if guess! < numberToGuess {
                    print("Higher!")
                    Hint.text = "Higher!"
                } else if guess! > numberToGuess {
                    print("Lower!")
                    Hint.text = "Lower!"
                }
            }
        } else {
            print("Please Fill Out All Fields")
        }

    }
    
}

