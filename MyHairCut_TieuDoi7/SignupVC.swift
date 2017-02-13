//
//  SignupVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/1/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

class SignupVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    @IBOutlet weak var userNameTxt: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(_ sender: Any) {
        if emailTxt.text == "" || passTxt.text == "" || confirmPassTxt.text == "" || userNameTxt.text == "" {
            
            let alertController = UIAlertController(title: "Xin lỗi!", message: "Bạn chưa nhập đầy đủ thông tin", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if passTxt.text != confirmPassTxt.text {
            
            let alertController = UIAlertController(title: "Xin lỗi!", message: "Nhập lại mật khẩu không trùng khớp", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            //kiểm tra các text đều đầy đủ và confirm pass đúng
            
            FIRAuth.auth()?.createUser(withEmail: emailTxt.text!, password: passTxt.text!, completion: { (user, error) in
                if error == nil {
                    
                    //tạo request để đổi username của user
                    
                    let changeRequest = user?.profileChangeRequest()
                    changeRequest?.displayName = self.userNameTxt.text!
                    changeRequest?.commitChanges { error in
                        
                        if error == nil {
                            
                            //đăng kí thành công
                            
                            let alertController = UIAlertController(title: "Chúc mừng!", message: "Bạn đã đăng kí thành công!", preferredStyle: .alert)
                            let OKAction = UIAlertAction(title: "OK", style: .cancel, handler:{(paramAction : UIAlertAction!) in _ = self.navigationController?.popViewController(animated: true)})
                            alertController.addAction(OKAction)
                            self.present(alertController, animated: true, completion: nil)

                        } else {
                            
                            //in ra lỗi nếu request có lỗi
                            
                            let alertController = UIAlertController(title: "Sorry!", message: error?.localizedDescription, preferredStyle: .alert)
                            let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(OKAction)
                            self.present(alertController, animated: true, completion: nil)

                            
                        }
                        
                    }
                    
                } else {
                    
                    //in ra lỗi nếu đăng kí có lỗi
                    
                    let alertController = UIAlertController(title: "Sorry!", message: error?.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            })
            
        }
    }

    
}
