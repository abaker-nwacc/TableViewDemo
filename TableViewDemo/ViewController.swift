//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Baker, Allen on 4/3/18.
//  Copyright © 2018 Baker, Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boyNames: [String] = []
    var girlNames: [String] = []
    
    @IBOutlet weak var boyNamesLabel: UILabel!
    @IBOutlet weak var girlNamesLabel: UILabel!
    @IBOutlet weak var selectedNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the data files into local arrays
        if let txtPath=Bundle.main.path(forResource: "GirlNames", ofType: "txt"){
            do{
                let names = try String(contentsOfFile: txtPath, encoding: .utf8).split(separator:"\r\n")
                for n in names {
                    girlNames.append(String(n))
                }
                girlNamesLabel.text = "Read \(girlNames.count) Girl names."
            }catch{
                girlNamesLabel.text = "Could not read GirlNames.txt"
            }
        }
        if let txtPath=Bundle.main.path(forResource: "BoyNames", ofType: "txt"){
            do{
                let names = try String(contentsOfFile: txtPath, encoding: .utf8).split(separator:"\r\n")
                for n in names {
                    boyNames.append(String(n))
                }
                boyNamesLabel.text = "Read \(boyNames.count) Boy names."
            }catch{
                boyNamesLabel.text = "Could not read BoyNames.txt"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TableTableViewController
        dest.boys = boyNames
        dest.girls = girlNames
    }

    // Unwind Segue Destination
    @IBAction func unwindToMain(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.source as! DetailViewController
        // Pull any data from the view controller which initiated the unwind segue.
        let destGender = sourceViewController.gender
        let destName = sourceViewController.kidName
        selectedNameLabel.text = destName
        if destGender == 0 {
            selectedNameLabel.backgroundColor = UIColor.purple
        }else{
            selectedNameLabel.backgroundColor = UIColor.blue
        }
    }
}

