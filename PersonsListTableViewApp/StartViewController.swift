//
//  StartViewController.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 14.04.2021.
//

import UIKit

protocol PersonViewControllerDelegate {
    func getPersons() -> [Person]
}

class StartViewController: UITabBarController, UINavigationControllerDelegate{
    
    let dataManagerBase = DataManager()
    var persons = [Person]()
    
    var randomNames = [String]()
    var randomSurnames = [String]()
    var randomPhones = [String]()
    var randomMails = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? ListViewController else { return }
        settingsVC.persons = persons
        settingsVC.delegate = self
//
//        tableViewControllers.forEach {
//            if let shortInformationNavigationVC = $0 as? UINavigationController {
//                let listVC = shortInformationNavigationVC.topViewController as! ListViewController
//                listVC.persons = persons
//                //print(persons)
//                listVC.delegate = self
//            }
//        }
    }
    
    func randomPersonList() {
        for personCount in 0..<randomNames.count {
            let person = Person(name: randomNames[personCount],
                                surname: randomSurnames[personCount],
                                phoneNumber: randomPhones[personCount],
                                mailAdress: randomMails[personCount])
            
            persons.append(person)
        }
    }
    
    func dataManagerListShuffled() {
        randomNames = dataManagerBase.names.shuffled()
        randomSurnames = dataManagerBase.surnames.shuffled()
        randomPhones = dataManagerBase.phoneNumbers.shuffled()
        randomMails = dataManagerBase.mailAdresses.shuffled()
    }

}

extension StartViewController: PersonViewControllerDelegate {
    func getPersons() -> [Person] {
       // persons
        //print(persons)
        dataManagerListShuffled()
        randomPersonList()
        
        return persons
    }
}
