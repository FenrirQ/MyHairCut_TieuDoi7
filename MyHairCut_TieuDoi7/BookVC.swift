//
//  BookVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/9/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class BookVC: UIViewController, UIPickerViewDelegate {

    
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var date: UIPickerView!
    
    //mảng để hiển thị picker view title
    var dateString : [String] = []
    
    //string lưu ngày để qua chọn ca
    var dateDidSelected : String!
    
    var currentMonth : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor(red: 214/255, green: 13/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "SFUIText-Semibold", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        self.navigationItem.title = "Book"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Giờ", style: .plain, target: self, action: #selector(goToShift))

        self.date.delegate = self
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date as Date)
        let month = components.month
        
        
        let dateFormatter: DateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols
        
        monthLbl.text = months?[month!-1]
        currentMonth = monthLbl.text
        
        switch month! {
        case 1,3,5,7,8,10,12:
            for i in 0...(31 - components.day!) {
                let tempString = getStringFromDate(s: TimeInterval(i * 86400))
                dateString.append(tempString)
            }
        case 4,6,9,11:
            for i in 0...(30 - components.day!) {
                let tempString = getStringFromDate(s: TimeInterval(i * 86400))
                dateString.append(tempString)
            }
        case 2:
            if components.year! % 4 == 0 {
                for i in 0...(29 - components.day!) {
                    let tempString = getStringFromDate(s: TimeInterval(i * 86400))
                    dateString.append(tempString)
                }
            } else {
                for i in 0...(28 - components.day!) {
                    let tempString = getStringFromDate(s: TimeInterval(i * 86400))
                    dateString.append(tempString)
                }
            }
        default:
            break
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateString.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateString[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: dateString[row], attributes: [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName: UIFont(name: "SFUIText-Light", size: 20)!])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dateDidSelected = dateString[row]
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getStringFromDate(s: TimeInterval) -> String {
        
        let date = NSDate(timeIntervalSinceNow: s)
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.weekday, .day, .month], from: date as Date)
        let day = components.day
        let weekday = components.weekday
        
        
        let dateFormatter: DateFormatter = DateFormatter()
        let weekdays = dateFormatter.weekdaySymbols
        
        let string = (weekdays?[weekday! - 1])! + " " + String(describing: day!)
        return string
        
    }
    
    func goToShift() {
        let shiftVC = self.storyboard?.instantiateViewController(withIdentifier: "shift") as!BookShiftVC
        shiftVC.dateTemp = currentMonth + " " + dateDidSelected
        self.navigationController?.pushViewController(shiftVC, animated: true)
    }

}
