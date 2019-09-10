//
//  TableViewController.swift
//  HazırTableView
//
//  Created by TT on 24.08.2019.
//  Copyright © 2019 TT. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var sehirler = ["ankara","istanbul","izmir"]

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
       let controller = UIAlertController(title: "Şehir Ekle", message: "Şehir ekleyiniz", preferredStyle: .alert)
     //  controller.addTextField {(textField) in textfield.placeHolder = " bir sehir giriniz."}
        controller.addTextField { (textField) in
            textField.placeholder = "bir sehir giriniz"
            
        }
        let action = UIAlertAction(title: "Şehir ekle", style: .default) {(action) in
            let textfield = controller.textFields![0]
            self.sehirler.append(textfield.text!)
            self.tableView.reloadData()
            
        }
      
        
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sehirler.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
cell.textLabel?.text=sehirler[indexPath.row]  // çalışması için class adı yukarıdakiyle aynı yapılmalı - main(sarı) (sağda) ->  customclass
        
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            sehirler.remove(at: indexPath.row)  // satır silme!!
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
          //tableView.insertRows(at: [IndexPath.init(row: self.sehirler.count-1, section: 0)], with: .automatic)
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
