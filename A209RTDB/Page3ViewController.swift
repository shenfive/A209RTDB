//
//  Page3ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController {

    @IBOutlet weak var theTableview: UITableView!
    var subject:[String:String] = [:]
    var nickname = ""
    @IBOutlet weak var inputText: UITextField!
    
    var list:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(subject)
        print(nickname)
        theTableview.dataSource = self
        self.title = subject["subject"]
        
        
        let key = subject["key"] ?? ""
        
        ref.child("d").child(key).observe(.value) { snapshot in
            for item in snapshot.children{
                let s1 = item as! DataSnapshot
                print(s1)
                print()
                let sitem = ["content":s1.childSnapshot(forPath: "c").value as! String,
                             "name":s1.childSnapshot(forPath: "n").value as! String,
                             "t":s1.childSnapshot(forPath: "t").value as! Double]
                self.list.append(sitem)
                
            }
            print(self.list)
            print(self.list.count)
            print()
        
            
         

        }
        
        
        

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

extension Page3ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
