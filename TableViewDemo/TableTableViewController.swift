//
//  TableTableViewController.swift
//  TableViewDemo
//
//  Created by Baker, Allen on 4/3/18.
//  Copyright © 2018 Baker, Allen. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    var girls:[String] = []
    var boys:[String] = []
    var both:[(Int,String)] = []
    var selectedIndexPath: IndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Baby Names"
        
        for n in girls{
            both.append((0,n))
        }
        for n in boys{
            both.append((1,n))
        }
        both.sort(by: {(n1,n2)->Bool in n1.1<n2.1})
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // Section 0 = Girls, Section 1 = Boys
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var result = 0;     // Number of rows
//        switch section {
//        case 0:     // Girls
//            result = girls.count
//        case 1:     // Boys
//            result = boys.count
//        default:    // Anything else
//            result = 0
//        }
//        return result
        return both.count
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var result = ""
//        switch section {
//        case 0:     // Girls
//            result = "Popular Girl's Names"
//        case 1:     // Boys
//            result = "Popular Boy's Names"
//        default:
//            result = ""
//        }
//        return result
//    }
//
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "End of Section"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
//        switch indexPath.section {
//        case 0:     // Girls
//            cell = tableView.dequeueReusableCell(withIdentifier: "girlNameCell", for: indexPath)
//            cell.textLabel?.text = girls[indexPath.row]
//        case 1:     // Boys
//            cell = tableView.dequeueReusableCell(withIdentifier: "boyNameCell", for: indexPath)
//            cell.textLabel?.text = boys[indexPath.row]
//        default:    // Will never happen
//            cell = tableView.dequeueReusableCell(withIdentifier: "boyNameCell", for: indexPath)
//            cell.textLabel?.text = "no name found"
//        }

        let kidName = both[indexPath.row]
        if kidName.0 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "girlNameCell", for: indexPath)
            cell.textLabel?.text = kidName.1
        }else if kidName.0 == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "boyNameCell", for: indexPath)
            cell.textLabel?.text = kidName.1
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "boyNameCell", for: indexPath)
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "no name found"
        }
        
        
        
        return cell
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect current cell
        
        // perform segue
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetailViewController
        dest.kidName = both[selectedIndexPath.row].1
        dest.gender = both[selectedIndexPath.row].0
    }
    
    // Unwind Segue Destination
    @IBAction func unwindToTVC(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.source as! DetailViewController
        // Pull any data from the view controller which initiated the unwind segue.
        let destGender = sourceViewController.gender
        let destName = sourceViewController.kidName
    }
}
