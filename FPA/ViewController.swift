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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("users")
        
    }
    
    func addUser() {
        let key = ref.childByAutoId().key
        
        let user = ["id": key,
                    "name": "Jake"]
        
        ref.child(key!).setValue(user)
        
    }

    @IBAction func Button1(_ sender: Any) {
        addUser()
    }
    
}

