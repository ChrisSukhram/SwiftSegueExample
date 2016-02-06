//
//  SettingsViewController.swift
//  SegueExample
//
//  Created by Chris Sukhram on 2/4/16.
//  Copyright © 2016 CKSMedia. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate {
    func didSetName(settingsViewController:SettingsViewController, newName:String)
}

class SettingsViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    var delegate:SettingsViewDelegate?
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.placeholder = name
    }

    @IBAction func setNamePressed(sender: UIButton) {
        delegate?.didSetName(self, newName: (nameTextField.text ?? ""))
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
