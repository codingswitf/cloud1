//
//  DetailViewController.swift
//  cloud
//
//  Created by MacGihuuji on 5/17/2559 BE.
//  Copyright © 2559 MacGihuuji. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var Gdata : TableViewController.Get_data?
    var get_dataid = ""
    var get_detail = ""
    var get_title = ""
    var get_datet = ""
    var get_id = ""
    var get_pic = ""
    
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var detail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_dataid = (Gdata?.getDataID())!
        get_detail = (Gdata?.getDetail())!
        get_title = (Gdata?.getTitle())!
        get_datet = (Gdata?.getDataID())!
        get_id = (Gdata?.getID())!
        get_pic = (Gdata?.getPic())!
        
        
      
        
        
        var attrStr = try! NSAttributedString(
            data: get_detail.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
         print("====================================")
        print(attrStr)
        print("====================================")

        // Set the text
        topic.text = get_title
        detail.attributedText = attrStr

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
