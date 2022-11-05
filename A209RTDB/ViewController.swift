//
//  ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var nickname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously()
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{//己登入
                self.status.text = "可進入"
            }else{//未登入
                self.status.text = "準備中..."
            }
        }
    }
    @IBAction func goNextPage(_ sender: Any) {
        let name = nickname.text ?? ""
        if name.count < 2 {
            print("no Go")
            return
        }
        self.performSegue(withIdentifier: "goPage2", sender: self)
    }
}

