//
//  Category.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct ResponseGenre:Decodable,Hashable{
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct CategoryResponse:Decodable{
    let genres:[ResponseGenre]?
}
