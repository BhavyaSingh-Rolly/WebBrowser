//
//  TableView.swift
//  Web Browser
//
//  Created by Bhavya Singh on 3/25/21.
//

import UIKit
import WebKit

/* Class : TableView
 Use : Implements tab switch table
 */
class TableView: UITableViewController {
    
    // Outlet for table view in storyboard
    @IBOutlet var table: UITableView!
    
    // To store url and thumbnails of tabs
    var tab_url:[URL] = []
    var thumbnail:[UIImage] = []
    
    // Constants
    let cell_height:CGFloat = 200

    /*
     Function Name : viewDidLoad
     Use : Initialise Table and register nib from TableViewCell file
     Parameters : None
     Return Type : None
     Return Value : None
     */
    override func viewDidLoad() {
        
        // Initialise Table
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        // Register nib from TableViewCell file
        table.register(TableViewCell.nib().self,
                       forCellReuseIdentifier: TableViewCell.id)
    }
    
    /*
     Function Name : tableView
     Use : Return the number of cells in table
     Parameters :   tableView of table.
                    section : index number identifying a section in tableView.
     Return Type : Int
     Return Value : Number of cells
     */
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int)
    -> Int {
        return tab_url.count
    }
    
    /*
     Function Name : tableView
     Use : Load each row cell
     Parameters :   tableView of table.
                    indexPath represents index path that locates a
                    row in tableView.
     Return Type : UITableViewCell
     Return Value : Table view cell
     */
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        
        // table view cell reusing TableViewCell file
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        
        // Set cell image and title according to url and thumbnail arrays
        cell.title.text = tab_url[ indexPath.row].absoluteString
        cell.pic.image = thumbnail[indexPath.row]
        return cell
    }
    
    /*
     Function Name : tableView
     Use : When cell is selected, return to previous view scene
     Parameters :   tableView of table.
                    indexPath represents index path that locates a
                    row in tableView.
     Return Type : None
     Return Value : None
     */
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {

        // indexPath.row is index of row selected
        // temp is view that called table view
        if let temp = presentingViewController as? ViewController {
            // Send data back to original view
            temp.current_index = indexPath.row
            // Restore tab selected
            temp.restoreTab(index: indexPath.row)
            }
        // Dismiss table
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     Function Name : tableView
     Use : Adjust hieght of each row
     Parameters :   tableView of table.
                    indexPath represents index path that locates a
                    row in tableView.
     Return Type : CGFloat
     Return Value : Height for each row
     */
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath)
    -> CGFloat {
        return cell_height
    }
}
