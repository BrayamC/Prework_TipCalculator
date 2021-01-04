//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brayam Corral on 1/3/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip0: UITextField!
    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var switchLight: UISwitch!
    
    var tip0_val = 0.15
    var tip1_val = 0.18
    var tip2_val = 0.20
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    // Gets value from text field and sends it to defaults
    @IBAction func changeTip0(_ sender: Any) {
        tip0_val = Double(tip0.text!) ?? 0.15
        defaults.set(tip0_val, forKey: "tip0")
    }
    
    // Gets value from text field and sends it to defaults
    @IBAction func changeTip1(_ sender: Any) {
        tip1_val = Double(tip1.text!) ?? 0.18
        defaults.set(tip1_val, forKey: "tip1")
    }
    
    // Gets value from text field and sends it to defaults
    @IBAction func changeTip2(_ sender: Any) {
        tip2_val = Double(tip2.text!) ?? 0.20
        defaults.set(tip2_val, forKey: "tip2")
    }
    
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
