//
//  PersonContactsViewController.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 14.04.2021.
//

import UIKit

class PersonContactsViewController: UIViewController {
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInformation()
    }
    
    func setInformation() {
        phoneLabel.text = "Phone: \(person.phoneNumber)"
        mailLabel.text = "Email: \(person.mailAdress)"
        
        navigationItem.title = person.fullyName
    }
}
