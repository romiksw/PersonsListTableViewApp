//
//  StartViewController.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 14.04.2021.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    let persons = Person.getContactList()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers(with: persons)
    }
    
    private func setUpViewControllers(with persons: [Person]) {
        let listViewController = viewControllers?.first as! ListViewController
        let sectionViewController = viewControllers?.last as! SectionViewController
        
        listViewController.persons = persons
        sectionViewController.persons = persons
    }
}
