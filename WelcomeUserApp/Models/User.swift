//
//  Person.swift
//  WelcomeUserApp
//
//  Created by Daniil on 13.03.22.
//

import Foundation

struct User {
    
    let login: String
    let password: String
    let person: Person
    
    static func getPersonData() -> User {
        User(
            login: "User",
            password: "password",
            person: Person(name: "Luka", surname: "Modric", age: 36, team: "Real Madrid", position: "midfielder")
        )
    }
}

struct Person {
    
    let name: String
    let surname: String
    let age: Int
    let team: String
    let position: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
}
