//
//  ViewController.swift
//  Click Counter
//
//  Created by Irfan on 15/07/19.
//  Copyright © 2019 Appachhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var counterLabel: UILabel!
    var prevCounterLabel: UILabel!
    var resetBtn: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = hexStringToUIColor(hex: "#ededed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Label to store the counter values
        var counterLabelTitle = createLabel(xaxis: 40, yaxis: 80, width: 140, height: 40, labelText: "Current Count")
        let counterLabel = createLabel(xaxis: 190, yaxis: 85, width: 60, height: 30, labelText: "0")
        counterLabel.layer.cornerRadius = 5
        counterLabel.backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        counterLabel.textAlignment = .center
        self.counterLabel = counterLabel

        // Label to store previous counter values
        var prevCounterLabelTitle = createLabel(xaxis: 40, yaxis: 140, width: 140, height: 40, labelText: "Previous Count")
        let prevCounterLabel = createLabel(xaxis: 190, yaxis: 145, width: 60, height: 30, labelText: "0")
        prevCounterLabel.layer.cornerRadius = 5
        prevCounterLabel.backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        prevCounterLabel.textAlignment = .center
        self.prevCounterLabel = prevCounterLabel

        // Button to increment the counter
        let counterBtn = UIButton()
        counterBtn.frame = CGRect(x: 40, y: 220, width: 100, height: 50)
        counterBtn.layer.cornerRadius = 5

        // Prepare UIImage using Assets defined
//        let myImage = UIImage(named: "counter")

        // Set the bg of button
//        counterBtn.setBackgroundImage(myImage, for: .normal)
        counterBtn.backgroundColor = hexStringToUIColor(hex: "#2fa763")
        counterBtn.setTitleColor(hexStringToUIColor(hex: "#FFFFFF"), for: .normal)
        counterBtn.setTitle("Count", for: .normal)

        // Push the button to the view
        view.addSubview(counterBtn)

        // Set the action event
        counterBtn.addTarget(self, action: #selector(ViewController.incrementCounter), for: .touchUpInside)

        // Button to reset the counter
        let resetBtn = UIButton()
        resetBtn.isEnabled = false
        resetBtn.frame = CGRect(x: 160, y: 220, width: 100, height: 50)
        resetBtn.layer.cornerRadius = 5
        resetBtn.backgroundColor = hexStringToUIColor(hex: "#a4a4af")
        resetBtn.setTitleColor(hexStringToUIColor(hex: "#FFFFFF"), for: .normal)
        resetBtn.setTitle("Reset", for: .normal)

        // Set the action event
        resetBtn.addTarget(self, action: #selector(ViewController.resetCounter), for: .touchUpInside)

        self.resetBtn = resetBtn
        view.addSubview(resetBtn)

        // Button to change background color
        let changeBG = UIButton()
        changeBG.frame = CGRect(x: 40, y: 300, width: 220, height: 50)
        changeBG.layer.cornerRadius = 5
        changeBG.backgroundColor = hexStringToUIColor(hex: "#5f76fd")
        changeBG.setTitleColor(hexStringToUIColor(hex: "#FFFFFF"), for: .normal)
        changeBG.setTitle("Change BG", for: .normal)
        
        // Set the action event
        changeBG.addTarget(self, action: #selector(ViewController.changeBG), for: .touchUpInside)
        view.addSubview(changeBG)

    }
    
    // @objc is required to expose instance method to objective-c
    @objc func incrementCounter() {
        self.prevCounterLabel.text = "\(self.count)"
        self.count += 1
        self.counterLabel.text = "\(self.count)"
        self.resetBtn.isEnabled = true
    }
    
    @objc func resetCounter() {
        self.prevCounterLabel.text = "0"
        self.count = 0
        self.counterLabel.text = "0"
        self.resetBtn.isEnabled = false
        view.backgroundColor = hexStringToUIColor(hex: "#ededed")
    }

    @objc func changeBG() {
        self.resetBtn.isEnabled = true
        view.backgroundColor = .random() // hexStringToUIColor(hex: "#")
    }

    func createLabel(xaxis: double_t, yaxis: double_t, width: double_t, height: double_t, labelText: String? = nil) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: xaxis, y: yaxis, width: width, height: height)
        label.text = labelText
        view.addSubview(label)
        return label
    }

    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}


