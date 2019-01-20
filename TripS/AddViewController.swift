//
//  AddViewController.swift
//  TripS
//
//  Created by 吉川莉央 on 2019/01/20.
//  Copyright © 2019 RioYoshikawa. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {
    
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet weak var TextField: UITextField!
    
    // インスタンス変数
    var DBRef:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //インスタンスを作成
        DBRef = Database.database().reference()
    }
    
    @IBAction func saveItem(_ sender: AnyObject){
        let data = ["name": contentTextView.text!]
        DBRef.child("user/01").setValue(data)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
