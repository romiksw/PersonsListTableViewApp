//
//  ListViewController.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 13.04.2021.
//

import UIKit

class ListViewController: UITableViewController {
    
    let dataManagerBase = DataManager()
    var persons = [Person]()
    
    var randomNames = [String]()
    var randomSurnames = [String]()
    var randomPhones = [String]()
    var randomMails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNames = dataManagerBase.names.shuffled()
        randomSurnames = dataManagerBase.surnames.shuffled()
        randomPhones = dataManagerBase.phoneNumbers.shuffled()
        randomMails = dataManagerBase.mailAdresses.shuffled()
        
        randomPerson()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "information", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = persons[indexPath.row].fullyName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personContactsVC = segue.destination as? PersonContactsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let person = persons[indexPath.row]
        personContactsVC.person = person
    }
    
    func randomPerson() {
        for personCount in 0..<randomNames.count {
            let person = Person(name: randomNames[personCount],
                                surname: randomSurnames[personCount],
                                phoneNumber: randomPhones[personCount],
                                mailAdress: randomMails[personCount])
            
            persons.append(person)
        }
    }
}
