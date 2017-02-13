//
//  AdviceVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 12/5/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

class AdviceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var lbl: UILabel!
    
    
    
    override func viewDidLoad() {
        lbl.text = "Chạm đề chọn ảnh gửi cho stylist của chúng tôi"
        let color = UIColor(red: 214/255, green: 13/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "SFUIText-Semibold", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
    }
    
    @IBOutlet weak var imgView: UIImageView!

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
 
    
    @IBAction func sendPhoto(_ sender: UIButton) {
        
        let storage = FIRStorage.storage()
        let rand = arc4random_uniform(35)
        let storageRef = storage.reference(forURL: "gs://haircutt-46487.appspot.com/\(rand).jpg")
        storageRef.downloadURL { (URL, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let data = NSData(contentsOf: URL!)
                self.imgView.image = UIImage(data: data as! Data)
                self.imgView.contentMode = .scaleAspectFit
                self.lbl.text = "Kiểu tóc phù hợp với bạn:"
            }
        }
    }
    
    
}
