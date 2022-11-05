//
//  ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously()
        
        ref = Database.database().reference().child("app1")

        ref.child("name").setValue("Danny")
        
        
        
    }


}

