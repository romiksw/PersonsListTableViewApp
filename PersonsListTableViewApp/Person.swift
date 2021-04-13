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

class DataManager {
    let names = ["Roma", "Misha", "Kostya"]
    let surnames = ["Ivanov", "Petrov", "Sidirov"]
    let phoneNumbers = ["+79990000001", "+79990000002", "+79990000003"]
    let mailAdresses = ["1email@yandex.ru", "2email@yandex.ru", "3email@yandex.ru"]
}
