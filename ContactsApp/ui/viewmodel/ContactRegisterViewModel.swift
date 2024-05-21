//
//  ContactRegisterViewModel.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 21.05.2024.
//

import Foundation

class ContactRegisterViewModel {
    var krepo = ContactsRepository()
    
    func save (contactName:String,contactPhone:String){
        krepo.save(contactName: contactName, contactPhone: contactPhone)
    }
    
}
