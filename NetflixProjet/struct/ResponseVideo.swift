//
//  VideoResponse.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct VideoType: Decodable,Hashable{
    let key:String?
    let type:String?
    
    init(key: String?, type: String?) {
        self.key = key
        self.type = type
    }
}

struct VideoResponse:Decodable{
    let results:[VideoType]
    
    init(results: [VideoType]) {
        self.results = results
    }
}
