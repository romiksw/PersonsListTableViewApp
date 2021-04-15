//
//  Person.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 13.04.2021.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let mailAdress: String
    
    var fullyName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getContactList() -> [Person] {
        
        var persons = [Person]()
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let phones = DataManager.shared.phoneNumbers.shuffled()
        let emails = DataManager.shared.mailAdresses.shuffled()
        
        let itterationCount = min(names.count, surnames.count, phones.count, emails.count)
        
        for index in 0..<itterationCount {
            let person = Person(name: names[index],
                                surname: surnames[index],
                                phoneNumber: phones[index],
                                mailAdress: emails[index])
            persons.append(person)
        }
        return persons
    }
}

enum Contacts: String {
    case phone = "phone"
    case email = "tray"
}
