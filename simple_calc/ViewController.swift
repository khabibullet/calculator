//
//  ViewController.swift
//  simple_calc
//
//  Created by Alebelly Nemesis on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    var leftNumberString: String? = "0"
    var rightNumberString: String? = "0"
    var operation = "+"
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func getButtonPress(_ sender: UIButton) {
        
        func resetCalc () {
            leftNumberString = "0"
            rightNumberString = "0"
            operation = "+"
        }
        
        func operateNums() {

            switch operation {

            case "+":
                leftNumberString = String(Int(leftNumberString!)! + Int(rightNumberString!)!)
            case "-":
                leftNumberString = String(Int(leftNumberString!)! - Int(rightNumberString!)!)
            case "✕":
                leftNumberString = String(Int(leftNumberString!)! * Int(rightNumberString!)!)
            case "÷":
                leftNumberString = String(Int(leftNumberString!)! / Int(rightNumberString!)!)
            default:
                break
            }
    
        }
            
        if let num = Int(sender.titleLabel!.text!) {
            if rightNumberString != "0" {
                rightNumberString!.append(String(num))
            } else {
                rightNumberString = String(num)
            }
        } else {
            if sender.titleLabel!.text! == "NEG" {
                rightNumberString = String(-Int(rightNumberString!)!)
            } else if sender.titleLabel!.text! == "AC" {
                resetCalc()
            } else {
                operateNums()
                rightNumberString = "0"
                resultLabel.text = leftNumberString!
                operation = sender.titleLabel!.text!
                return
            }
        }
        resultLabel.text = rightNumberString!
    }
    
}
