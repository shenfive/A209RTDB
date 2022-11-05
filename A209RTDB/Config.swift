//
//  Config.swift
//  A209RTDB
//
//  Created by 申潤五 on 2022/11/5.
//

import Foundation
import Firebase
import UIKit

var ref = Database.database().reference().child("app1")



extension ViewController{
    func showMessage(_ msg:String){
        var alert = UIAlertController(title: "提醒", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "朕知道了", style: .default))
        present(alert, animated: true)
    }
}

