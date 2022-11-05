//
//  ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously()
        ref.child("appname").observe(.value) { snapshot in
            if let name = snapshot.value as? String{
                self.display.text = name
            }
        }
      
        
    }


}

