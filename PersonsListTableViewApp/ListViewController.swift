//
//  ListViewController.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 13.04.2021.
//

import UIKit

class ListViewController: UITableViewController {
    
    var delegate: PersonViewControllerDelegate!
    var persons: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(delegate)
        
//        persons = delegate.getPersons()
        print(persons)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(persons)
        //delegate.getPersons()
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
}
