//
//  ContactRegisterViewController.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 8.05.2024.
//

import UIKit

class ContactRegisterVC: UIViewController {

    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var contactPhoneText: UITextField!
    
    var viewModel = ContactRegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func saveButton(_ sender: Any) {
        if let name = contactNameText.text, let phone = contactPhoneText.text {
            viewModel.save(contactName:name, contactPhone:phone)
        }
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
}
