//
//  Book.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

struct Book: Identifiable, Codable{
    
    let id : Int
    let image : String
    let questions : [Question]
    var status : BookStatus
 
}

enum BookStatus: Codable{
    case active, inactive, locked
}
