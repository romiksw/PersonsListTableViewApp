//
//  DataManager.swift
//  PersonsListTableViewApp
//
//  Created by Roman Kozlov on 15.04.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let names = ["Roma", "Misha", "Kostya"]
    let surnames = ["Ivanov", "Petrov", "Sidirov"]
    let phoneNumbers = ["+79990000001", "+79990000002", "+79990000003"]
    let mailAdresses = ["1email@yandex.ru", "2email@yandex.ru", "3email@yandex.ru"]
    
    private init() {}
}

