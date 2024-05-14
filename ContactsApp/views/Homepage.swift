//
//  ViewController.swift
//  ContactsApp
//
//  Created by Abdulkadir Aktar on 8.05.2024.
//

import UIKit

class Homepage: UIViewController { //SEARCHTEXT METODU İÇİN

    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var contactList = [Contacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self //searchbarın func ile bağlanması için
        contactTableView.delegate = self // bu sayfaya bağlantı
        contactTableView.dataSource = self
        
        let c1 = Contacts(contact_id: 1, contact_name: "Kadir", contact_phone: "541 364 5521")
        let c2 = Contacts(contact_id: 2, contact_name: "Hilal", contact_phone: "544 544 2323")
        let c3 = Contacts(contact_id: 3, contact_name: "Zeynep", contact_phone: "543 623 2376")
        contactList.append(c1)
        contactList.append(c2)
        contactList.append(c3)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let contact = sender as? Contacts {
                let gotoVC = segue.destination as! ContactInfoVC
                gotoVC.contact = contact
            }
        }
    }

}

extension Homepage :UISearchBarDelegate { //karmaşıklık olmaması için protocol
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Contact search: \(searchText)")
    }
}
extension Homepage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // satır sayısı
        return contactList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //hücreye erişmek ve üzerindeki görsellere veri aktarma // kişi kadar görüntülenme
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactsCell
        let contact = contactList[indexPath.row]
        
        
        cell.contactNameLabel.text = contact.contact_name
        cell.contactPhoneLabel.text = contact.contact_phone
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //seçim yapınca oluşan metod
        let contact = contactList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: contact)
        tableView.deselectRow(at: indexPath, animated: true) // seçili kalmaması için
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //sağa kaydırma
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            contextualAction,view,bool in
            let contact = self.contactList[indexPath.row]
            print("Selected Delete")
            let alert = UIAlertController(title: "Delete", message: "\(contact.contact_name!) silinsin mi?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "cancel", style: .cancel)
            alert.addAction(deleteAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ _ in
                print("Contact Delete : \(contact.contact_id!)")
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
