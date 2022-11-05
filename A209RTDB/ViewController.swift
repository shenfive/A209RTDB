//
//  ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously()

        var someOne = ["name":"Danny","age":20] as [String : Any]
        
        ref.child("members").childByAutoId().setValue(someOne)
        
    }


}

