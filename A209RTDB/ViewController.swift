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
    
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously()
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil{//己登入
                self.status.text = "可進入"
            }else{//未登入
                self.status.text = "準備中..."
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "goPage2":
            let nexeVC = segue.destination as? Page2ViewController
            nexeVC?.nickName = name
        default:
            break
        }
    }
    
    
    
    @IBAction func goNextPage(_ sender: Any) {
        name = nickname.text ?? ""
        if name.count < 2 {
            showMessage("匿稱至少兩個字元")
            return
        }
        self.performSegue(withIdentifier: "goPage2", sender: self)
    }
}

