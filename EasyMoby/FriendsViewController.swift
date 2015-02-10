//
//  FriendsViewController.swift
//  EasyMoby
//
//  Created by Vikramaditya on 2/10/15.
//  Copyright (c) 2015 Vikramaditya. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var array:NSArray = NSArray()
    var filePoiner:FileReader?
    var NO_OF_FRIENDS:Int = 0
    var filepath:String = "/Users/vikramaditya/Documents/friends.txt" //change if required
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return NO_OF_FRIENDS
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsViewCell", forIndexPath: indexPath) as FriendsViewCell
        var name:AnyObject = self.array.objectAtIndex(indexPath.row)
        cell.name.setTitle("\(name)", forState: UIControlState.Normal)
        cell.friendCheck.tag = indexPath.row
        cell.friendCheck.addTarget(self, action: "makeFriend:", forControlEvents: UIControlEvents.TouchUpInside)
       
        return cell
    }
    
    func loadData(){
        var data:NSMutableArray = NSMutableArray()
        data.removeAllObjects()
        NO_OF_FRIENDS = 0
        filePoiner = FileReader(path: filepath)
        while var line = filePoiner?.nextLine(){
            data.addObject(line)
            NO_OF_FRIENDS++
        }
        filePoiner?.close()
        var tmp:NSArray = data.reverseObjectEnumerator().allObjects
        self.array = tmp
        
    }
    func makeFriend(sender: UIButton){
        println(sender.tag)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
