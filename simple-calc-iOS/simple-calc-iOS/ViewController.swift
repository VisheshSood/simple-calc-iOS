//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Vishesh Sood on 4/17/17.
//  Copyright © 2017 Vishesh Sood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var label: UILabel!
  
  var numbers = [Double]()
  var operation = ""
  var needToClearScreen = false;
  
  
  
  @IBAction func numbers(_ sender: UIButton) {
    if (label.text! == "0" || needToClearScreen) {
      label.text = sender.currentTitle!
      needToClearScreen = false;
    } else {
      label.text = label.text! + sender.currentTitle!
    }
  }
  
  
  @IBAction func operations(_ sender: UIButton) {
    var val:Double = Double(0.0)
    
    if (label.text != "") {
      val = Double(label.text!)!
    }
    // If it is a factorial, lets get it over with.
    if sender.currentTitle == "Fact"{
      numbers.append(val)
      if numbers.count == 1 {
        var answer = 1
        var factNumber = Int(numbers[0])
        if factNumber == 0 {
          answer = 1
        }else {
          while factNumber > 0{
            answer *= factNumber
            factNumber -= 1
          }
        }
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      }
    }
    
    // The rest is considering that it is not a factorial.
    if sender.currentTitle != "Fact"{
      numbers.append(val)
    }
    
    if sender.currentTitle != "=" && sender.currentTitle != "Fact" {
      operation = sender.currentTitle!
      needToClearScreen = true;
    } else {
      switch operation {
      // Average Case
      case "Avg":
        var answer = 0.0
        let count:Double = Double(numbers.count)
        for number in numbers {
          answer = answer + number
        }
        answer = answer/count
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 4)
        }
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Count Case
      case "Count":
        label.text = String(numbers.count)
        numbers = []
        operation = ""
        needToClearScreen = true;
      
      // Mod Case
      case "Mod":
        var answer = 0.0
        for number in numbers{
          if answer == 0.0{
            answer = number
          }else{
            answer = answer.truncatingRemainder(dividingBy: number)
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0 {
          answer = answer.roundTo(places: 8)
        }
        label.text = String(answer)
        numbers = []
        operation = ""
        needToClearScreen = true;
      
      // Add Case
      case "+":
        var answer = 0.0
        for number in numbers{
          answer = answer + number
        }
        label.text = String(answer)
        operation = ""
        numbers = []
        needToClearScreen = true;
      
      // Subtract Case
      case "-":
        var answer = 0.0
        answer = numbers[0]-numbers[1]
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Divide Case
      case "÷":
        var answer = 0.0
        for i in numbers{
          if answer == 0.0{
            answer = i
          }else{
            answer = answer / i
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Multiply Case
      case "x":
        var answer = 0.0
        for number in numbers{
          if answer == 0.0 {
            answer = number
          }else{
            answer = answer * number
          }
        }
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      default:
        print("Failed...?")
      }
      
    }
    
  }
  
  
  @IBAction func clear(_ sender: UIButton) {
    numbers = []
    label.text = "0"
    operation = ""
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension Double {
  /// Rounds the double to decimal places value
  func roundTo(places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}

