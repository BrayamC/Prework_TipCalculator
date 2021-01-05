//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brayam Corral on 1/3/21.
//

import UIKit

// Settings page -- values are stored in user defaults to use in main page
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip0: UITextField!
    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var switchLight: UISwitch!
    
    // Default values for segment control on main page
    var tip0_val = 0.15
    var tip1_val = 0.18
    var tip2_val = 0.20
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        tip0.layer.borderColor = UIColor.gray.cgColor
        tip1.layer.borderColor = UIColor.gray.cgColor
        tip2.layer.borderColor = UIColor.gray.cgColor
        tip0.layer.borderWidth = 1.0
        tip1.layer.borderWidth = 1.0
        tip2.layer.borderWidth = 1.0
    }
    
    // changeTip0 -- Gets value from text field and sends it to defaults
    @IBAction func changeTip0(_ sender: Any) {
        tip0_val = Double(tip0.text!) ?? 0.15
        defaults.set(tip0_val, forKey: "tip0")
    }
    
    // changeTip1 -- Gets value from text field and sends it to defaults
    @IBAction func changeTip1(_ sender: Any) {
        tip1_val = Double(tip1.text!) ?? 0.18
        defaults.set(tip1_val, forKey: "tip1")
    }
    
    // changeTip2 -- Gets value from text field and sends it to defaults
    @IBAction func changeTip2(_ sender: Any) {
        tip2_val = Double(tip2.text!) ?? 0.20
        defaults.set(tip2_val, forKey: "tip2")
    }
    
    // changeLightMode -- stores setting of dark mode in user defaults
    @IBAction func changeLightMode(_ sender: Any) {
        if switchLight.isOn {
            defaults.set(true, forKey: "DarkMode")
            self.view.backgroundColor = UIColor.black
        }else{
            defaults.set(false, forKey: "DarkMode")
            self.view.backgroundColor = UIColor.white
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let state = defaults.bool(forKey: "DarkMode")
        switchLight.setOn(state, animated: false)
        
        if state {
            self.view.backgroundColor = UIColor.black
        }else{
            self.view.backgroundColor = UIColor.white
        }
    }

}
