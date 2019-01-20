//
//  AddViewController.swift
//  TripS
//
//  Created by 吉川莉央 on 2019/01/20.
//  Copyright © 2019 RioYoshikawa. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    
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
    
//    アルバムから写真の取得
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
        
    }
//    カメラとアルバムの呼び出しメソッド
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true,completion: nil)
        }
    }
    
//写真が選択された時に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        self.dismiss(animated: true, completion: nil)
        //画像の出力
        photoImageView.image = info[.originalImage]as? UIImage
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
