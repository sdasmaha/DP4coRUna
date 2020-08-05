//
//  PreferenceController.swift
//  DP4coRUna
//
//  Created by YANBO JIANG on 7/30/20.
//

import UIKit

class PerferenceController: UITableViewController {
    var itemArray = K.preferenceItemArray
    let defaults = UserDefaults.standard
    var itemArraySelected: Set<SaveOptions>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.object(forKey: K.preferenceCell) as? Set<SaveOptions>{
            itemArraySelected = items
        }
        if itemArraySelected != nil{
            for i in itemArraySelected!{
                i.tableCell.cellForRow(at:i.indexPath)?.accessoryType = .checkmark
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.preferenceCell, for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at:indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at:indexPath)?.accessoryType = .none
            let a = SaveOptions(tableCell: tableView, indexPath: indexPath)
            self.itemArraySelected?.remove(a)
            self.defaults.setValue(self.itemArraySelected, forKey: K.perosonalTestCell)
        }else{
            tableView.cellForRow(at:indexPath)?.accessoryType = .checkmark
            let a = SaveOptions(tableCell: tableView, indexPath: indexPath)
            self.itemArraySelected?.insert(a)
            self.defaults.setValue(self.itemArraySelected, forKey: K.perosonalTestCell)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
