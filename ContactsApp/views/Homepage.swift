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
    
    var viewModel = HomepageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self //searchbarın func ile bağlanması için
        contactTableView.delegate = self // bu sayfaya bağlantı
        contactTableView.dataSource = self
        //dinleme
        _ = viewModel.contactsList.subscribe(onNext: { list in
            self.contactList = list
            self.contactTableView.reloadData() // tableview içeriğini değiştir
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.contactSave()
        //bu sayfaya dönüldüğünde veriler yüklenmiş olacak
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
        viewModel.search(searchWord: searchText)
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
                self.viewModel.delete(contact_id: contact.contact_id!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
