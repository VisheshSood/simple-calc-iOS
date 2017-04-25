//
//  HistoryTableViewController.swift
//  simple-calc-iOS
//
//  Created by Vishesh Sood on 4/24/17.
//  Copyright © 2017 Vishesh Sood. All rights reserved.
//

import UIKit

class HistoryTableViewController: UIViewController, UITableViewDataSource {
  
  var history = [String]()
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return history.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = history[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "HISTORY"
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destViewController : ViewController = segue.destination as! ViewController
    destViewController.historyList = history
  }
  
  
  override func viewDidLoad() {
    
  }
}
