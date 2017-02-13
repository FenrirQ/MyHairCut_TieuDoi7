//
//  LoginVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/1/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passTxt: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FIRAuth.auth()?.currentUser) != nil {
            self.performSegue(withIdentifier: "goToTabbar", sender: self)
        }
        
        let color = UIColor(red: 214/255, green: 13/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "SFUIText-Semibold", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(_ sender: Any) {
        
        if emailTxt.text! == "" || passTxt.text! == "" {
            
            let alertController = UIAlertController(title: "Xin lỗi!", message: "Bạn chưa nhập tên đăng nhập hoặc mật khẩu", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: emailTxt.text!, password: passTxt.text!, completion: {(user, error) in
                
                if error == nil {
                    
                   self.performSegue(withIdentifier: "goToTabbar", sender: self)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Xin lỗi!", message: "Đăng nhập không thành công", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            })
            
        }
        
    }
    
    @IBAction func goToSignup(_ sender: Any) {
        
        let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(signupVC, animated: true)
        
    }
    
    @IBAction func forgetPass(_ sender: Any) {
        
        //tạo alert có text field
        
        let alert = UIAlertController(title: "Bạn quên mật khẩu?", message: "Nhập vào email của bạn", preferredStyle: .alert)
        var myTxt : UITextField?
        alert.addTextField(configurationHandler: {(textField : UITextField) in
            myTxt = textField
        })
        
        //tạo action OK để gửi vào mail
        
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(paramAction : UIAlertAction!) in
            FIRAuth.auth()?.sendPasswordReset(withEmail: (myTxt?.text)!, completion: {(error) in
                
                if error == nil {
                    
                    let alertController = UIAlertController(title: "Thành công", message: "Bạn có thể vào mail và thực hiện reset mật khẩu", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "", message: error?.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            })
        })
        
        //tạo action cancel
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
