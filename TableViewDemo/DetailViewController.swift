//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Baker, Allen on 4/3/18.
//  Copyright © 2018 Baker, Allen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var kidName: String = ""
    var gender: Int = 0
    
    @IBOutlet weak var kidNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Selected Baby"
        
        kidNameLabel.text = kidName
        if gender == 0 {     // Girl
            self.view.backgroundColor = UIColor.purple
        }else{
            self.view.backgroundColor = UIColor.blue
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
