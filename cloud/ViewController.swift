//
//  ViewController.swift
//  cloud
//
//  Created by MacGihuuji on 5/17/2559 BE.
//  Copyright © 2559 MacGihuuji. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{


    @IBOutlet weak var mTableView: UITableView!
    var row = 0
    var data : [Get_data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mTableView.dataSource = self
        let urlString = "http://cloudapis.azurewebsites.net/test1.php"
        if  let url = NSURL(string: urlString) {
            let URLRequest = NSMutableURLRequest(URL: url)
            URLRequest.HTTPMethod = "GET"
            Alamofire.request(URLRequest).responseJSON { response in
                //print(response.result.value)
                let json = JSON(response.result.value!)
//                print(json)
                self.row = (json.count)
                self.mTableView.reloadData()
                
                for i in 0  ..< self.row{
                    let dataID = json[i]["dataID"].stringValue
                    let detail = json[i]["detail"].stringValue
                    let tit = json[i]["title"].stringValue
                    let datet = json[i]["datet"].stringValue
                    let id = json[i]["id"].stringValue
                    let pic = json[i]["pic"].stringValue
                    let leag = Get_data(dataID : dataID , detail: detail, title : tit , datet: datet, id : id , pic: pic)
                    self.data.append(leag)
                }
                print(self.data)
                self.mTableView.reloadData()
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.mTableView.dequeueReusableCellWithIdentifier("cell") as! TextTableViewCell
        print("////////")
        print(self.data[indexPath.row].getTitle())
        cell.titleText.text = self.data[indexPath.row].getTitle()
        return cell
    }
    
    class Get_data {
        var dataID: String?
        var detail : String?
        var title: String?
        var datet : String?
        var id: String?
        var pic : String?
        init(dataID : String , detail : String, title : String , datet : String, id : String , pic : String){
            self.dataID = dataID
            self.detail = detail
            self.title = title
            self.datet = datet
            self.id = id
            self.pic = pic
        }
        func getDataID() -> String {
            return self.dataID!
        }
        func getTitle() -> String {
            return self.title!
        }
        func getDetail() -> String {
            return self.detail!
        }
        func getDatet() -> String {
            return self.datet!
        }
        func getID() -> String {
            return self.id!
        }
        func getPic() -> String {
            return self.pic!
        }
    }


}

