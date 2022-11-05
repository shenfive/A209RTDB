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

        ref.child("time").setValue(ServerValue.timestamp())
        
        ref.child("name").child("0").observeSingleEvent(of: .value) { snapshot in
            if let x = snapshot.value as? String{
                print(x)
            }
        }
        
        ref.child("time").observeSingleEvent(of: .value) { snapshot in
            if let x = snapshot.value as? Double{
                var time = x / 1000
                var theTime = Date(timeIntervalSince1970: time)
                
                print("======\(theTime)==")
                
                
                
                
                
            }
        }

        
        
        
    }


}

