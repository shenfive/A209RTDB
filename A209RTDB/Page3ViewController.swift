//
//  Page3ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController {

    var subject:[String:String] = [:]
    var nickname = ""
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(subject)
        print(nickname)
        
        self.title = subject["subject"]

    }
    

    @IBAction func newMessage(_ sender: Any) {
        let input = inputText.text ?? ""
        
        if input.count < 3 {
            showMessage("請輸入至少三個字元")
            return
        }
        
        let fitem = ["n":nickname,"c":input,"t":ServerValue.timestamp()] as [String : Any]
        ref.child("d").child(subject["key"] ?? "").childByAutoId().setValue(fitem) {error, reference in
            if let error = error{
                self.showMessage(error.localizedDescription)
                return
            }
            self.inputText.text = ""
        }
        
        
        
        
    }
    
}
