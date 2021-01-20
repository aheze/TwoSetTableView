//
//  ViewController.swift
//  TwoSetTableView
//
//  Created by Zheng on 1/20/21.
//

import UIKit

class TableCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}

class ViewController: UIViewController {

    var myFirstData = ["Hello", "Hi"]
    var mySecondData = ["Goodbye", "Bye"]
    var combinedData = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combinedData = myFirstData + mySecondData /// set combinedData (will not affect myFirstData or mySecondData)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return combinedData.count /// simply return the count of the entire combinedData array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellIdentifier", for: indexPath) as! TableCell
        let textAtRow = combinedData[indexPath.row] /// also get what to display from combinedData
        cell.label.text = textAtRow
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let textAtRow = combinedData[indexPath.row]
        
        let title = "Capitalize"
        
        let action = UIContextualAction(style: .normal, title: title, handler: { (_,_,_) in
            
            let uppercasedText = textAtRow.uppercased()
            
            /// Update data source when user taps action
            self.combinedData[indexPath.row] = uppercasedText
            
            /// if you want to modify the original arrays
            if let firstIndex = self.myFirstData.firstIndex(of: textAtRow) { /// get first index of text at this row, if exists
                self.myFirstData[firstIndex] = uppercasedText /// set the text to the new text
            }
            if let firstIndex = self.mySecondData.firstIndex(of: textAtRow) {
                self.mySecondData[firstIndex] = uppercasedText
                
            }
            
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            
            print("Combined: \(self.combinedData),\nmyFirstData: \(self.myFirstData),\nmySecondData: \(self.mySecondData)\n")
        })
        
        action.image = UIImage(systemName: "textformat")
        action.backgroundColor = .blue
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
}

