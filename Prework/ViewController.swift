//
//  ViewController.swift
//  Prework
//
//  Created by Brayam Corral on 12/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorSwitch: UISwitch!
    
    @IBOutlet weak var BillAmountDesc: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var rateDesc: UILabel!
    @IBOutlet weak var ratelabel: UILabel!
    
    @IBOutlet weak var tipPercantageDesc: UILabel!
    @IBOutlet weak var tipPercantageLabel: UILabel!
   
    @IBOutlet weak var totalDesc: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // Number pad
    @IBOutlet weak var key_1: UIButton!
    @IBOutlet weak var key_2: UIButton!
    @IBOutlet weak var key_3: UIButton!
    @IBOutlet weak var key_4: UIButton!
    @IBOutlet weak var key_5: UIButton!
    @IBOutlet weak var key_6: UIButton!
    @IBOutlet weak var key_7: UIButton!
    @IBOutlet weak var key_8: UIButton!
    @IBOutlet weak var key_9: UIButton!
    @IBOutlet weak var key_0: UIButton!
    @IBOutlet weak var key_enter: UIButton!
    @IBOutlet weak var key_clear: UIButton!
    
    var bill = ""
    
    override func viewDidLoad() {super.viewDidLoad()}
    @IBAction func onTap(_ sender: Any) {}
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercantages = [0.15, 0.18, 0.2]
        
        // Calculate tip and total
        let tip = bill * tipPercantages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Slider and set Rate label
        tipSlider.value = Float(tipPercantages[tipControl.selectedSegmentIndex])
        ratelabel.text = String(tipSlider.value)
        
        // Update the tip and total labels
        tipPercantageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Calculate tip and total
        let tip = bill * Double(tipSlider.value)
        let total = bill + tip
        
        // Update the tip and total labels
        tipPercantageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        ratelabel.text = String(tipSlider.value)
        
    }
    
    @IBAction func clearText(_ sender: Any){
        bill = ""
        tipPercantageLabel.text = ""
        totalLabel.text = ""
        ratelabel.text = ""
    }
    
    // Number pad
    @IBAction func numPad(_ sender: Any) {
        if key_enter.isTouchInside{
            calculateTip(self)
        }
        else if key_1.isTouchInside {
            bill += "1"
        }
        
        else if key_2.isTouchInside {
            bill += "2"
        }
        
        else if key_3.isTouchInside{
            bill += "3"
        }
        
        else if key_4.isTouchInside{
            bill += "4"
        }
        
        else if key_5.isTouchInside{
            bill += "5"
        }
        
        else if key_6.isTouchInside{
            bill += "6"
        }
        
        else if key_7.isTouchInside{
            bill += "7"
        }
        
        else if key_8.isTouchInside{
            bill += "8"
        }
        
        else if key_9.isTouchInside{
            bill += "9"
        }
        
        else if key_0.isTouchInside{
            bill += "0"
        }
        else if key_clear.isTouchInside{
            clearText(self)
        }
        billAmountTextField.text = bill
    }

    // Dark / light Mode
    @IBAction func changeColor(_ sender: Any) {
        
        let white = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        if colorSwitch.isOn {
            
            self.view.backgroundColor = white
            
            tipPercantageLabel.backgroundColor = white
            totalLabel.backgroundColor = white
            billAmountTextField.backgroundColor = white
            
            // change color for numpad
            key_1.backgroundColor = white
            key_2.backgroundColor = white
            key_3.backgroundColor = white
            key_4.backgroundColor = white
            key_5.backgroundColor = white
            key_6.backgroundColor = white
            key_7.backgroundColor = white
            key_8.backgroundColor = white
            key_9.backgroundColor = white
            key_0.backgroundColor = white
            key_clear.backgroundColor = white
            key_enter.backgroundColor = white

            // Change color of UI segment
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for:.normal)
            
        } else {
            self.view.backgroundColor = black
            
            tipPercantageLabel.backgroundColor = black
            totalLabel.backgroundColor = black
            billAmountTextField.backgroundColor = black
            
            // change color for numpad
            key_1.backgroundColor = black
            key_2.backgroundColor = black
            key_3.backgroundColor = black
            key_4.backgroundColor = black
            key_5.backgroundColor = black
            key_6.backgroundColor = black
            key_7.backgroundColor = black
            key_8.backgroundColor = black
            key_9.backgroundColor = black
            key_0.backgroundColor = black
            key_clear.backgroundColor = black
            key_enter.backgroundColor = black
            
            // Change color of UI segment
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.normal)
        }
    }
}

