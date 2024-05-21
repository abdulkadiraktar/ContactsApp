//
//  ContactInfoViewModel.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 21.05.2024.
//

import Foundation


class ContactInfoViewModel {
    var krepo = ContactsRepository()
    
    func edit (contact_id:Int,contact_name:String,contact_phone:String){
        krepo.edit(contact_id: contact_id, contact_name: contact_name, contact_phone: contact_phone)
    }
}
