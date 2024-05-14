//
//  Contacts.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 8.05.2024.
//

import Foundation

class Contacts {
    var contact_id:Int?
    var contact_name:String?
    var contact_phone:String?
    
    init(contact_id: Int, contact_name: String, contact_phone: String) {
        self.contact_id = contact_id
        self.contact_name = contact_name
        self.contact_phone = contact_phone
    }
    
}
