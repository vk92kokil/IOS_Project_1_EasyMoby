//
//  PostViewController.swift
//  EasyMoby
//
//  Created by Vikramaditya on 2/10/15.
//  Copyright (c) 2015 Vikramaditya. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var charRemaining: UILabel!
    @IBOutlet weak var postArea: UITextView!
    var filepath:String = "/Users/vikramaditya/Documents/abc.txt" //change if required
    var maxChar:Int = 160
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
            self.automaticallyAdjustsScrollViewInsets = false; // Avoid the top UITextView space, iOS7 (~bug?)
  //      }
        postArea.delegate = self
        postArea.layer.borderWidth = 0.5
        postArea.layer.cornerRadius = 5
        postArea.layer.borderColor = UIColor.blackColor().CGColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func textView(postArea: UITextView, shouldChangeTextInRange range:NSRange,replacementText text:String!) -> Bool{
        var newlength:Int = (postArea.text as NSString).length + (text as NSString).length - range.length
        var remainingChar = maxChar - newlength
        charRemaining.text = "\(remainingChar)"
        
        return (newlength >= maxChar) ? false : true
        
    }
    @IBAction func postText(sender: UIBarButtonItem) {
        if(!postArea.text.isEmpty){
            var str:NSString = "\(postArea.text)\n"
            var text:NSData = str.dataUsingEncoding(NSUTF8StringEncoding)!
            
            if NSFileManager.defaultManager().fileExistsAtPath(filepath) {
                var err:NSError?
                if let fileHandle = NSFileHandle(forWritingAtPath: filepath) {
                    fileHandle.seekToEndOfFile()
                    fileHandle.writeData(text)
                    fileHandle.closeFile()
                }
                else {
                    println("Can't open fileHandle \(err)")
                }
            }
            
            var alert = UIAlertController(title: "Success", message: "Posted Successfully", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.Default){
                action in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                self.navigationController?.popViewControllerAnimated(true)
            }
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            println("Empty message")
            var alert = UIAlertController(title: "Error", message: "Empty Message", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.Default){
                action in
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

}
