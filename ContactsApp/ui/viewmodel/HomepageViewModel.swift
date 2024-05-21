//
//  HomepageViewModel.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 21.05.2024.
//

import Foundation
import RxSwift

class HomepageViewModel {
    var krepo = ContactsRepository()
    var contactsList = BehaviorSubject<[Contacts]>(value: [Contacts]())
    
    init(){
        contactsList = krepo.contactsList //bağlantı
    }
    
    func search(searchWord:String){
        krepo.search(searchWord: searchWord)
    }
    
    
    func delete(contact_id:Int){
        krepo.delete(contact_id: contact_id)
        contactSave()
    }
    
    func contactSave(){
        krepo.contactSave()
    }
}
