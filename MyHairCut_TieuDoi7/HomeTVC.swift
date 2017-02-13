//
//  HomeTVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/5/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class HomeTVC: UITableViewController {

    var styles : [hairStyles]!
    
    var detail : DetailStyleVC!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Styles"
        
        let undercut = hairStyles(tenImg: "toc-nam-undercut-ngan-dep-2015-2016-cho-khuon-mat-tron-banh-bao-13.jpg", name: "Undercut")
        let layer = hairStyles(tenImg: "ten-goi-cac-kieu-toc-nam-han-quoc-duoc-yeu-thich-nhat-1454443389-56b10b7dd9b2c.jpg", name: "Tỉa Layer")
        let slickedBack = hairStyles(tenImg: "Slicked-backKieu-toc-dep-va-don-gian-nhat-moi-thoi-dai_5.jpg", name: "Slicked Back")
        let simpleCasual = hairStyles(tenImg: "52834-nhung-kieu-toc-dep-cho-nam-2.jpg", name: "Simple Casual")
        let sidePart = hairStyles(tenImg: "side_part_hairstyles_men_7.jpg", name: "Side Part")
        let quiff = hairStyles(tenImg: "toc-quiff-nam-dep-sanh-dieu-khong-loi-mot-thoi-trang-2015-2016-7.jpg", name: "Quiff")
        let pompadour = hairStyles(tenImg: "modern-pompadour.jpg", name: "Pompadour")
        let topKnot = hairStyles(tenImg: "toc-bui-dac-quyen-khong-cua-rieng-ai.jpg", name: "Top Knot")
        let ceasar = hairStyles(tenImg: "buzz-cut-men-hairstyles.jpg", name: "Ceasar")
        let brushedUp = hairStyles(tenImg: "brushed-up.jpg", name: "Brushed Up")
        let angularFringe = hairStyles(tenImg: "20160404-121857-asian-boy-hairstyles_520x711.jpg", name: "Angular Fringe")
        
        styles = [undercut, layer, slickedBack, simpleCasual, sidePart, quiff, pompadour, topKnot, ceasar, brushedUp, angularFringe]
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return styles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CellTVCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTVCell

        cell.imgView.image = styles[indexPath.row].img
        cell.imgView.contentMode = .scaleAspectFit
        cell.nameLbl.text = styles[indexPath.row].name
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        detail = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailStyleVC
        detail.titleStyle = styles[indexPath.row].name

        self.navigationController?.pushViewController(detail, animated: true)
        
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
