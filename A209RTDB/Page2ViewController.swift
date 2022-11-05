//
//  Page2ViewController.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController {

    @IBOutlet weak var theTableView: UITableView!
    
    var flist:[[String:String]] = []
    var nickName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "討論區列表"
        
        theTableView.delegate = self
        theTableView.dataSource = self
        
        ref.child("sub").observeSingleEvent(of: .value) { snapshot in
            
            
            for item in snapshot.children{
                let s1 = item as! DataSnapshot
                let fitem = ["subject":s1.childSnapshot(forPath: "t").value as! String,"key":s1.key]
                
                self.flist.append(fitem)
                
            }
            print(self.flist)
            
            self.theTableView.reloadData()
        }
    }
}

extension Page2ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flistcell", for: indexPath) as! FListTableViewCell
        cell.name.text = flist[indexPath.row]["subject"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(flist[indexPath.row])
        print(nickName)
    }
    
    
}
