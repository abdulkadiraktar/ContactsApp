//
//  ContactsRepository.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 21.05.2024.
//

import Foundation
import RxSwift


class ContactsRepository {
    
    var contactsList = BehaviorSubject<[Contacts]>(value: [Contacts]())
    func save (contactName:String,contactPhone:String){
        print("Kişi Kaydedildi: \(contactName) - \(contactPhone)")
    }
    func edit (contact_id:Int,contact_name:String,contact_phone:String){
        print("Edit: \(contact_id) - \(contact_name) - \(contact_phone)")
    }
    
    func search(searchWord:String){
        print("Contact Search : \(searchWord)")
    }
    
    
    func delete(contact_id:Int){
        print("Contact Delete : \(contact_id)")
    }
    
    func contactSave(){
        var list = [Contacts]()
        let c1 = Contacts(contact_id: 1, contact_name: "Kadir", contact_phone: "541 364 5521")
        let c2 = Contacts(contact_id: 2, contact_name: "Hilal", contact_phone: "544 544 2323")
        let c3 = Contacts(contact_id: 3, contact_name: "Zeynep", contact_phone: "543 623 2376")
        list.append(c1)
        list.append(c2)
        list.append(c3)
        
        contactsList.onNext(list) //veri taşıma
    }
    
}
