//
//  ViewController.swift
//  SegueExample
//
//  Created by Chris Sukhram on 2/4/16.
//  Copyright © 2016 CKSMedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewDelegate {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if name.isEmpty {
            infoLabel.text = "Hit settings to enter your name 👍🏽"
        }
    }
    
    func didSetName(settingsViewController: SettingsViewController, newName: String) {
        name = newName
        updateUI()
    }
    
    func updateUI() {
        if name.isEmpty {
            infoLabel.text = "Hit settings to enter your name 👍🏽"
            nameLabel.text = ""
        }
        else {
            infoLabel.text = ""
            nameLabel.text = "Welcome \(name)"
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modifySettingsSegue" {
            let settingsVC = segue.destinationViewController as! SettingsViewController
            settingsVC.delegate = self
            
            if name.isEmpty {
                settingsVC.name = "Enter Name"
            }
            else {
                settingsVC.name = name
            }
        }
    }
}

