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
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var prevCounterLabel: UILabel!
    @IBOutlet var resetBtn: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = hexStringToUIColor(hex: "#ededed")
        self.resetBtn.isEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // @objc is required to expose instance method to objective-c
    @IBAction func incrementCounter() {
        self.prevCounterLabel.text = "\(self.count)"
        self.count += 1
        self.counterLabel.text = "\(self.count)"
        self.resetBtn.isEnabled = true
    }
    
    @IBAction func resetCounter() {
        self.prevCounterLabel.text = "0"
        self.count = 0
        self.counterLabel.text = "0"
        self.resetBtn.isEnabled = false
        view.backgroundColor = hexStringToUIColor(hex: "#ededed")
    }

    @IBAction func changeBG() {
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


