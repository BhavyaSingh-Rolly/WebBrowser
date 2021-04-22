//  TableViewCell.swift
//  Web Browser
//
//  Created by Bhavya Singh on 3/26/21.

import UIKit

/* Class : TableView
 Use : Implements tab switch table rows
 */
class TableViewCell: UITableViewCell {
    
    // Cell identifier
    static let id = "TableViewCell"
    
    /*
     Function Name : nib
     Use : nib object that specifies the nib file used to create the cell
     Parameters : None
     Return Type : UINib
     Return Value : Cell nib
     */
    // Cell nib
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    // Outlet to images in cell
    @IBOutlet var pic: UIImageView!
    @IBOutlet var title: UILabel!
    
    /*
     Function Name : awakeFromNib
     Use : Initialize TableViewCell Class
     Parameters : None
     Return Type : Void
     Return Value : None
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /*
     Function Name : setSelected
     Use :  Called when cell is selected. Does nothing. Function
            tableView(_ tableView: UITableView, didSelectRowAt indexPath:
            IndexPath) in Table View also called when cell selected and
            dismisses table view.
     Parameters:selected: true to set the cell as selected. False by default
                animated: true to animate the transition between selected
                states. False by default
     Return Type : None
     Return Value : None
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
