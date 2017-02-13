//
//  HomeVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 12/6/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController , UITabBarControllerDelegate{

    
    
    @IBOutlet weak var helloLbl: UILabel!
    @IBOutlet weak var bookLbl: UILabel!
    @IBOutlet weak var deleteDate: CustomButton!
    
    
    @IBOutlet weak var leadingContraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        //checkOnTime()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Kiểu tóc", style: .plain, target: self, action: #selector(goToStyles))
        let color = UIColor(red: 214/255, green: 13/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "SFUIText-Semibold", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        self.tabBarController?.tabBar.barTintColor = color
        self.tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkOnTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openMenu(_ sender: Any) {
        if menuShowing {
            leadingContraint.constant = -270
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            leadingContraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        menuShowing = !menuShowing
    }

    @IBAction func logOut(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        let alertController = UIAlertController(title: "", message: "Bạn có chắc là muốn đăng xuất!", preferredStyle: .alert)
        let cacelAction = UIAlertAction(title: "Không", style: .cancel, handler: nil)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler:{(paramAction : UIAlertAction!) in self.dismiss(animated: true, completion: nil)})
        alertController.addAction(cacelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func goToStyles() {
        let homeTVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeTVC") as! HomeTVC
        self.navigationController?.pushViewController(homeTVC, animated: true)
    }
    
    func checkOnTime() {
        let date = NSDate(timeIntervalSinceNow: 86400)
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: date as Date)
        let day = components.day
        let user = FIRAuth.auth()?.currentUser
        helloLbl.text = "Xin chào, \((user?.displayName)!)"
        let database = FIRDatabase.database().reference()
        database.child("Firebase/user").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild((user?.uid)!) {
                self.deleteDate.isHidden = false
                database.child("Firebase/user/\((user?.uid)!)").observeSingleEvent(of: .value, with: { (snapshot) in
                    let tmpString = snapshot.value as! String
                    let stringArr = tmpString.characters.split(separator: " ").map(String.init)
                    let date = stringArr[0] + " " + stringArr[1] + " " + stringArr[2]
                    var shift = ""
                    if day == Int(stringArr[2]) {
                        snapshot.ref.child(snapshot.key).parent?.removeValue()
                    } else {
                        switch(Int(stringArr[3])!) {
                        case 0:
                            shift = "8:00"
                        case 1:
                            shift = "9:00"
                        case 2:
                            shift = "10:00"
                        case 3:
                            shift = "15:00"
                        case 4:
                            shift = "16:00"
                        case 5:
                            shift = "17:00"
                        default:
                            break
                        }
                        self.bookLbl.text = shift + " " + date
                    }
                })
            } else {
                self.bookLbl.text = "Bạn chưa đặt lịch!"
                self.deleteDate.isHidden = true
            }
        })

    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let fromView: UIView = tabBarController.selectedViewController!.view
        let toView  : UIView = viewController.view
        if fromView == toView {
            return false
        }
        
        UIView.transition(from: fromView, to: toView, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft) { (finished:Bool) in
            
        }
        return true
    }
    
    
    @IBAction func deletedDate(_ sender: Any) {
        let user = FIRAuth.auth()?.currentUser
        let database = FIRDatabase.database().reference()
        database.child("Firebase/user").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild((user?.uid)!) {
                database.child("Firebase/user/\((user?.uid)!)").observeSingleEvent(of: .value, with: { (snapshot) in
                    snapshot.ref.child(snapshot.key).parent?.removeValue()
                    let alertController = UIAlertController(title: "", message: "Đã huỷ lịch!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                    self.viewWillAppear(true)
                })
            }
        })
    }

}
