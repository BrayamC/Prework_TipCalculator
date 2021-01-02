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
    
    @IBOutlet weak var tipPercantageDesc: UILabel!
    @IBOutlet weak var tipPercantageLabel: UILabel!
   
    @IBOutlet weak var totalDesc: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercantages = [0.15, 0.18, 0.2]
        
        // Calculate tip and total
        let tip = bill * tipPercantages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Slider
        tipSlider.value = Float(tipPercantages[tipControl.selectedSegmentIndex])
        
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
        
    }
    
    // Dark / light Mode
    @IBAction func changeColor(_ sender: Any) {
        
        let white = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        if colorSwitch.isOn {
            
            self.view.backgroundColor = white
            
            BillAmountDesc.textColor = black
            billAmountTextField.textColor = black
            
            tipPercantageDesc.textColor = black
            tipPercantageLabel.textColor = black
            
            totalDesc.textColor = black
            totalLabel.textColor = black
            
        } else {
            self.view.backgroundColor = black
            
            BillAmountDesc.textColor = white
            billAmountTextField.textColor = white
            
            tipPercantageDesc.textColor = white
            tipPercantageLabel.textColor = white
            
            totalDesc.textColor = white
            totalLabel.textColor = white
        }
    }
    
    
    
}

