//
//  ContactsCell.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 8.05.2024.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
