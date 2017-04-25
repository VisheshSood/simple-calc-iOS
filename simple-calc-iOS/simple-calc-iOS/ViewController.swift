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
  @IBOutlet weak var historyLabel: UILabel!

  var numbers = [Double]()
  var operation = ""
  var needToClearScreen = false;
  var count = 0;
  var historyArray = [String]()
  var historyValue = ""
  
  
  
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
    if sender.currentTitle == "Fact" {
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
        historyValue = String(val) + "! = " + String(answer)
        historyArray.append(historyValue)
        operation = ""
        historyValue = ""
        needToClearScreen = true;
      }
    }
    
    // The rest is considering that it is not a factorial.
    if sender.currentTitle != "Fact" {
      numbers.append(val)
      historyValue = "" + String(val);
    }
    
    if (sender.currentTitle == "Count") {
      count = count + 1
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
        historyValue = "Avg("
        for number in numbers {
          historyValue = historyValue + String(number) + " "
          answer = answer + number
        }
        answer = answer/count
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 4)
          historyValue = historyValue + ") = " + String(answer)
        }
        historyValue = historyValue + ") = " + String(answer)
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Count Case
      case "Count":
        if (count == 1) {
          label.text = String(count)
        } else {
          count = count + 1;
          label.text = String(count)
        }
        historyValue = "Count("
        for number in numbers {
          historyValue = historyValue + String(number) + " "
        }
        historyValue = historyValue + ") = " + String(count)
        numbers = []
        count = 0
        operation = ""
        needToClearScreen = true;
      
      // Mod Case
      case "Mod":
        historyValue = ""
        var answer = 0.0
        for i in 1...numbers.count{
          if i == numbers.count{
            historyValue = historyValue+" \(numbers[i-1])"
          }else{
            historyValue = historyValue+" \(numbers[i-1]) " + operation
          }
          
          if answer == 0.0{
            answer = numbers[i-1]
          }else{
            answer = answer.truncatingRemainder(dividingBy: numbers[i-1])
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        historyValue = historyValue+" = "+"\(answer)"
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Add Case
      case "+":
        historyValue = ""
        var answer = 0.0
        for i in 1...numbers.count{
          if i == numbers.count{
            historyValue = historyValue + " \(numbers[i-1])"
          }else{
            historyValue = historyValue + " \(numbers[i-1]) " + operation
          }
          
          if answer == 0.0{
            answer = numbers[i-1]
          }else{
            answer = answer + numbers[i-1]
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        historyValue = historyValue+" = "+"\(answer)"
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Subtract Case
      case "-":
        historyValue = ""
        var answer = 0.0
        for i in 1...numbers.count{
          if i == numbers.count{
            historyValue = historyValue+" \(numbers[i-1])"
          }else{
            historyValue = historyValue+" \(numbers[i-1]) " + operation
          }
          
          if answer == 0.0{
            answer = numbers[i-1]
          }else{
            answer = answer - numbers[i-1]
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        historyValue = historyValue+" = "+"\(answer)"
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Divide Case
      case "÷":
        historyValue = ""
        var answer = 0.0
        for i in 1...numbers.count{
          if i == numbers.count{
            historyValue = historyValue + " \(numbers[i-1])"
          }else{
            historyValue = historyValue + " \(numbers[i-1]) " + operation
          }
          
          
          if answer == 0.0{
            answer = numbers[i-1]
          }else{
            answer = answer / numbers[i-1]
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        historyValue = historyValue+" = "+"\(answer)"
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      
      // Multiply Case
      case "x":
        historyValue = ""
        var answer = 0.0
        for i in 1...numbers.count{
          
          if i == numbers.count{
            historyValue = historyValue + "\(numbers[i-1])"
          }else{
            historyValue = historyValue + "\(numbers[i-1]) " + operation
          }
          
          
          if answer == 0.0{
            answer = numbers[i-1]
          }else{
            answer = answer * numbers[i-1]
          }
        }
        if answer.truncatingRemainder(dividingBy: 1) != 0{
          answer = answer.roundTo(places: 8)
        }
        historyValue = historyValue + " = " + "\(answer)"
        numbers = []
        label.text = String(answer)
        operation = ""
        needToClearScreen = true;
      default:
        print("Failed...?")
      }
      if (historyValue != "") {
        historyArray.append(historyValue)
      }
    }
    
  }
  
  
  @IBAction func clear(_ sender: UIButton) {
    numbers = []
    label.text = "0"
    operation = ""
    count = 0
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destViewController : HistoryTableViewController = segue.destination as! HistoryTableViewController
    destViewController.history = historyArray
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

