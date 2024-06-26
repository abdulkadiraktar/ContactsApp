//
//  ContactInfoVC.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 8.05.2024.
//

import UIKit

class ContactInfoVC: UIViewController {

    @IBOutlet weak var contactPhoneText: UITextField!
    @IBOutlet weak var contactNameText: UITextField!
    
    var contact:Contacts?
    
    var viewModel = ContactInfoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = contact {
            contactNameText.text = c.contact_name
            contactPhoneText.text = c.contact_phone
        }
    }
    

    @IBAction func editButton(_ sender: Any) {
        if let c = contact, let name = contactNameText.text, let phone = contactPhoneText.text {
            viewModel.edit(contact_id: c.contact_id! , contact_name: name, contact_phone: phone)
        }
    }
    
   

}
