//
//  TableViewController.swift
//  EasyMoby
//
//  Created by Vikramaditya on 2/10/15.
//  Copyright (c) 2015 Vikramaditya. All rights reserved.
//
import Foundation
import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var array:NSArray = NSArray()
    var filePoiner:FileReader?
    var NO_OF_POSTS:Int = 0
    var filepath:String = "/Users/vikramaditya/Documents/abc.txt" //change if required
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadData()
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    override func viewWillAppear(animated: Bool) {
        var tableBorderLeft:CGFloat = 20;
        var tableBorderRight:CGFloat = 20;
        
        var tableRect:CGRect = self.view.frame;
        tableRect.origin.x += tableBorderLeft; // make the table begin a few pixels right from its origin
        tableRect.size.width -= tableBorderLeft + tableBorderRight; // reduce the width of the table
        tableView.frame = tableRect;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return NO_OF_POSTS
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("TableViewCell",forIndexPath: indexPath) as TableViewCell
        
        var message:AnyObject = self.array.objectAtIndex(indexPath.row)
        //cell.userName.setTitle("Username", forState: UIControlState.Normal)
        cell.post.text = "\(message)"
        cell.postTime.text = "1 min ago"
        //cell.profileImage.image = UIImage(named: "clock")
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2.0
        cell.profileImage.clipsToBounds = true
        cell.layer.borderWidth = 5.0
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        
        return cell

    }

    func loadData(){
        var data:NSMutableArray = NSMutableArray()
        data.removeAllObjects()
        NO_OF_POSTS = 0
        filePoiner = FileReader(path: filepath)
        while var line = filePoiner?.nextLine(){
            data.addObject(line)
            NO_OF_POSTS++
        }
        filePoiner?.close()
        var tmp:NSArray = data.reverseObjectEnumerator().allObjects
        self.array = tmp

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let toViewController = segue.destinationViewController as UIViewController
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }


}
