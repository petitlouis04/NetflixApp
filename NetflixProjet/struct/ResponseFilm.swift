//
//  ResponseFilm.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct ResponseFilm :Decodable{
    let original_title:String
    let overview:String
    let genres: [ResponseGenre]?
    let poster_path:String
    let release_date:String
    let runtime:Int
    let id:Int
    let videos:VideoResponse?
    
    init(original_title: String, overview: String, genres: [ResponseGenre]?, poster_path: String, release_date: String, runtime: Int, id: Int, videos: VideoResponse?) {
        self.original_title = original_title
        self.overview = overview
        self.genres = genres
        self.poster_path = poster_path
        self.release_date = release_date
        self.runtime = runtime
        self.id = id
        self.videos = videos
    }
}

struct DataFilmResponseId: Decodable,Hashable{
    let original_title:String?
    let adult:Bool?
    let release_date:String?
    let poster_path:String?
    let id:Int?
    let overview:String?
    
    init(original_title: String?, adult: Bool?, release_date: String?, poster_path: String?, id: Int?, overview: String?) {
        self.original_title = original_title
        self.adult = adult
        self.release_date = release_date
        self.poster_path = poster_path
        self.id = id
        self.overview = overview
    }
}

struct DataFilmResponse: Decodable{
    let results: [DataFilmResponseId]?
    
    init(results: [DataFilmResponseId]?) {
        self.results = results
    }
}


