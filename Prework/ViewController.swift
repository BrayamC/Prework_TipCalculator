//
//  ViewController.swift
//  Prework
//
//  Created by Brayam Corral on 12/29/20.
//
// Tip Calculator App for ios

import UIKit

class ViewController: UIViewController {
    
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
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
    
    // Total Animation
    @IBOutlet weak var backTotal: UILabel!
    @IBOutlet weak var whiteTotalLabel: UILabel!
    var totalAnimation = false
    
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
    
    // Segment Control values
    var tipPercantages = [0.15, 0.18, 0.2]
    
    var bill = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }
    
    @IBAction func onTap(_ sender: Any) {}
    
    // setTipValue -- sets the segment control to the given value at the corresponding index
    func setTipValue(index: Int, val: Double){
        tipControl.setTitle(String(val*100) + "%", forSegmentAt: index)
        tipPercantages[index] = val
        
    }
    
    // getTipValue -- returns the array of tip percantages located at the segment control
    func getTipValue() -> [Double]{
        return tipPercantages
    }
    
    
    // resetTotalAnimation -- attempts to move total text out of view. Makes sure objects are in correct  position before moving to old location
    func resetTotalAnimation(){
        if totalAnimation {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                 self.totalLabel.transform = CGAffineTransform(translationX: self.totalLabel.bounds.origin.x, y: self.totalLabel.bounds.origin.y + 130)
                
                self.totalDesc.transform = CGAffineTransform(translationX: self.totalDesc.bounds.origin.x, y: self.totalDesc.bounds.origin.y + 130)
                
                self.backTotal.transform = CGAffineTransform(translationX: self.backTotal.bounds.origin.x, y: self.backTotal.bounds.origin.y + 130)
            }, completion: nil)
            totalAnimation = false
        }
    }
    
    
    // startTotalAnimation -- attempts to move total text into view. Makes sure objects are in correct  position before moving to new location
    func startTotalAnimation(){
        if !totalAnimation {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                 self.totalLabel.transform = CGAffineTransform(translationX: self.totalLabel.bounds.origin.x, y: self.totalLabel.bounds.origin.y - 130)
                
                self.totalDesc.transform = CGAffineTransform(translationX: self.totalDesc.bounds.origin.x, y: self.totalDesc.bounds.origin.y - 130)
                
                self.backTotal.transform = CGAffineTransform(translationX: self.backTotal.bounds.origin.x, y: self.backTotal.bounds.origin.y - 130)
            }, completion: nil)
            totalAnimation = true
        }
    }
    
    
    // addcurrencythousandsSeparators --  adds commas to large number
    func addcurrencythousandsSeparators(num: Double) -> String{
        // Insert commas to number and return
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let formattedNumber = numberFormatter.string(from: NSNumber(value:num))
        return String(formattedNumber!)

    }
    
    
    // calculateTip -- calculates tip when the user pressed enter on hte number pad
    @IBAction func calculateTip(_ sender: Any) {
        
        // Gets bill as a double, removes commas and $
        let billNoCommas = String(billAmountTextField.text!).filter("0123456789.".contains)
        let bill = Double(billNoCommas) ?? 0
        let tipPercantages = getTipValue()
        
        // Calculate tip and total
        let tip = bill * tipPercantages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalCommas = addcurrencythousandsSeparators(num: total)
        
        // Update Slider and set Rate label
        tipSlider.value = Float(tipPercantages[tipControl.selectedSegmentIndex])
        ratelabel.text = String(tipSlider.value)
        
        // Add commas to tip
        let tipCommas = addcurrencythousandsSeparators(num: tip)
        
        // Update the tip and total labels
        tipPercantageLabel.text = String(tipCommas)
        totalLabel.text = String(totalCommas)
        
        startTotalAnimation()
        
        // Save data
        defaults.set(bill, forKey: "bill")
        defaults.set(String(tipPercantages[tipControl.selectedSegmentIndex]), forKey: "rate")
        defaults.set(tipCommas, forKey: "tip")
        defaults.set(String(totalCommas), forKey: "total")
        
    }
    
    
    // calculateTipSlider -- total is calculated if slider is manually moved
    @IBAction func calculateTipSlider(_ sender: Any) {

        // Gets bill as a double, remove commas and $
        let billNoCommas = String(billAmountTextField.text!).filter("0123456789.".contains)
        let bill = Double(billNoCommas) ?? 0
        
        // Calculate tip and total
        let tip = bill * Double(tipSlider.value)
        let total = bill + tip
        let totalCommas = addcurrencythousandsSeparators(num: total)
        
        // Add commas to tip
        let tipCommas = addcurrencythousandsSeparators(num: tip)
        
        // Update the tip and total labels
        tipPercantageLabel.text = String(tipCommas)
        totalLabel.text = String(totalCommas)
        ratelabel.text = String(tipSlider.value)
        
        // Save data
        defaults.set(bill, forKey: "bill")
        defaults.set(String(tipPercantages[tipControl.selectedSegmentIndex]), forKey: "rate")
        defaults.set(tipCommas, forKey: "tip")
        defaults.set(String(totalCommas), forKey: "total")
        
    }
    
    
    // cleatText -- clears text labels of app
    @IBAction func clearText(_ sender: Any){
        bill = ""
        tipPercantageLabel.text = ""
        totalLabel.text = ""
        ratelabel.text = ""
    }
    
    
    // numpad -- Number pad functionality of app. Concatinates input into a string
    @IBAction func numPad(_ sender: Any) {
        if key_enter.isTouchInside{calculateTip(self)}
        else if key_1.isTouchInside {bill += "1"}
        else if key_2.isTouchInside {bill += "2"}
        else if key_3.isTouchInside {bill += "3"}
        else if key_4.isTouchInside {bill += "4"}
        else if key_5.isTouchInside {bill += "5"}
        else if key_6.isTouchInside {bill += "6"}
        else if key_7.isTouchInside {bill += "7"}
        else if key_8.isTouchInside {bill += "8"}
        else if key_9.isTouchInside {bill += "9"}
        else if key_0.isTouchInside {bill += "0"}
        else if key_clear.isTouchInside{
            clearText(self)
            resetTotalAnimation()
        }
        
        // Add commas to input from user(bill)
        billAmountTextField.text = bill
        let billcommas = Double(billAmountTextField.text!) ?? 0
        billAmountTextField.text = addcurrencythousandsSeparators(num: billcommas)
    }
    
    
    // changeColorSettings -- Changes the light mode of app... true: light Mode, false: dark mode
    func changeColorSettings(LightMode: Bool) {
        
        let white = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        if !LightMode {
            
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
            
            // Change color of total Animation
            backTotal.backgroundColor = white
            whiteTotalLabel.backgroundColor = white
            totalDesc.backgroundColor = white
            
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
            
            // Change color of total Animation
            backTotal.backgroundColor = black
            whiteTotalLabel.backgroundColor = black
            totalDesc.backgroundColor = black
        }
    }
    
    
    // reloadData -- reloads input from previous calculation. Works across app restarts (t < 10m)
    func reloadData(){
        let tempBill = defaults.double(forKey: "bill")
        if(tempBill > 0){
            billAmountTextField.text = addcurrencythousandsSeparators(num: tempBill)
            ratelabel.text = String(defaults.string(forKey: "rate") ?? " ")
            tipPercantageLabel.text = String(defaults.string(forKey: "tip") ?? " ")
            totalLabel.text = String(defaults.string(forKey: "total") ?? " ")
            startTotalAnimation()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set segment control to new values
        let val0 = defaults.double(forKey: "tip0")
        setTipValue(index: 0, val: val0)
        let val1 = defaults.double(forKey: "tip1")
        setTipValue(index: 1, val: val1)
        let val2 = defaults.double(forKey: "tip2")
        setTipValue(index: 2, val: val2)
        
        // set Light/Dark mode to corresponding setting
        let light = defaults.bool(forKey: "DarkMode")
        changeColorSettings(LightMode: light)
        
        // Output previous calculation
        reloadData()

    }
}
