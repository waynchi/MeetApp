//
//  AddEventTableViewController.swift
//  meetUp
//
//  Created by Student on 11/14/15.
//  Copyright (c) 2015 Wayne. All rights reserved.
//

import UIKit

protocol AddEventViewControllerDelegate{
    func passEvent(eventPassed: Dictionary<String,String>)
}


class AddEventTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var dict = Dictionary<String,String>()
    var pickerData: [String] = [String]()
    var pickerViewCurrRow: Int!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var MoreInfoTextView: UITextView!
    
    @IBOutlet weak var NoPeopleScroll: UIPickerView!
    
    @IBOutlet weak var DatePick: UIDatePicker!
    
    @IBOutlet weak var StartTimePick: UIDatePicker!
    
    @IBOutlet weak var EndTimePick: UIDatePicker!
    
    @IBOutlet weak var LocationInformation: UITextField!
    
    @IBOutlet weak var MoreInfoField: UITextView!
    
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    @IBAction func doCancelButtton(sender: UIBarButtonItem){
        if sender.tag == 1{
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    @IBAction func doDoneButtton(sender: UIBarButtonItem){
        if sender.tag == 2{
            dict["name"] = NameTextField.text
            let dateFormat = NSDateFormatter()
            
            
            dict["date"] = dateFormat.stringFromDate(DatePick.date)
            dict["stime"] = dateFormat.stringFromDate(StartTimePick.date)
            dict["etime"] = dateFormat.stringFromDate(EndTimePick.date)
            
            dict["numpeople"] = pickerData[pickerViewCurrRow]
            dict["info"] = MoreInfoField.text
            
            //dict["location_lat"] =
            
            //dict["location_long"] =
            
        }
        // name, date, start time, end time, location, no people, more info
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CancelButton.tag = 1
        DoneButton.tag = 2
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        let tapGesture = UITapGestureRecognizer(target: self, action: "tap:")
        view.addGestureRecognizer(tapGesture)
        pickerViewCurrRow = 0
        MoreInfoTextView.layer.borderWidth = 0.5
        MoreInfoTextView.layer.borderColor = UIColor.grayColor().CGColor
        MoreInfoTextView.layer.cornerRadius = 5.0
        MoreInfoTextView.delegate = self
        
        NameTextField.delegate = self
        
        pickerData = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
        NoPeopleScroll.delegate = self
        NoPeopleScroll.dataSource = self
        
        //NameTextField.returnKeyType = .Done
        
        // NoPeopleScroll.delegate = self
        
    }
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewCurrRow = row
    }
    
    
    func tap(gesture: UITapGestureRecognizer){
        NameTextField.resignFirstResponder()
        MoreInfoTextView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0
    }*/
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
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
