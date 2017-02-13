//
//  BookShiftVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/10/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

class BookShiftVC: UIViewController {

    
    var dateTemp : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grayButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectShift(_ sender: Any) {
        let tag = (sender as AnyObject).tag - 100
        let alertController = UIAlertController(title: "", message: "Bạn muốn đặt giờ này?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Không", style: .cancel, handler: nil)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler:{(paramAction : UIAlertAction!) in self.upDate(tag: tag)})
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

    func upDate(tag: Int) {
        let database = FIRDatabase.database().reference()
        let userID = FIRAuth.auth()?.currentUser?.uid
        database.child("Firebase/user").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if snapshot.hasChild(userID!){
                
                let alertController = UIAlertController(title: "Bạn đã đặt trước đó rồi", message: "Bạn muốn đồi lịch không?", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Không", style: .cancel, handler: nil)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler:{(paramAction : UIAlertAction!) in self.changeShift(tag: tag)})
                alertController.addAction(OKAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
                
            }else{
                
                database.child("Firebase/user/\(userID!)").setValue(self.dateTemp + " " + String(tag))
                let alertController = UIAlertController(title: "", message: "Xong! Lịch cắt tóc của bạn đã được đặt!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(paramAction : UIAlertAction!) in _ = self.navigationController?.popViewController(animated: true)})
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
        })
    }
    
    func changeShift(tag: Int) {
        let userID = FIRAuth.auth()?.currentUser?.uid
        let database = FIRDatabase.database().reference()
        database.child("Firebase/user/\(userID!)").setValue(self.dateTemp + " " + String(tag))
        let alertController = UIAlertController(title: "", message: "Thay đổi thành công!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(paramAction : UIAlertAction!) in _ = self.navigationController?.popViewController(animated: true)})
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func grayButton() {
        let database = FIRDatabase.database().reference()
        database.child("Firebase/user").observe(FIRDataEventType.value, with: { snapshot in
            for childSnap in  snapshot.children.allObjects {
                let snap = childSnap as! FIRDataSnapshot
                let tmpString = snap.value as! String
                let stringArr = tmpString.characters.split(separator: " ").map(String.init)
                let dateToGray = stringArr[0] + " " + stringArr[1] + " " + stringArr[2]
                let shiftToGray = stringArr[3]
                if self.dateTemp == dateToGray {
                    let tmpButton = self.view.viewWithTag(Int(shiftToGray)! + 100) as? UIButton
                    tmpButton?.backgroundColor = UIColor.darkGray
                    tmpButton?.isEnabled = false
                }
            }
        })
        
    }
}
