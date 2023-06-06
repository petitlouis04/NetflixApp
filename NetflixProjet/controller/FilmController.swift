//
//  FilmController.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//

import Foundation

//request to catch all the new movie
func catchFilm(idCategory:Int?) async -> DataFilmResponse?{
    var apiUrl = URL(string: "https://api.themoviedb.org/3/search/movie?query=string&include_adult=true&language=en-US&page=1&api_key=9a8f7a5168ace33d2334ba1fe14a83fb")!
    if(idCategory != nil){
        if let id = idCategory{
            apiUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=9a8f7a5168ace33d2334ba1fe14a83fb&sort_by=popularity.desc&with_genres=" + String(id))!
        }
        
    }
    
    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, response) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(DataFilmResponse.self, from:data)
        return responseFilm
        
    } catch {
        print("Erreur : \(error.localizedDescription)")
    }
    return nil
}

func catchCategory() async -> CategoryResponse?{
    let apiUrl = URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en?&api_key=9a8f7a5168ace33d2334ba1fe14a83fb")!
    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, response) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(CategoryResponse.self, from:data)
        return responseFilm
        
    } catch {
        print("Erreur : \(error.localizedDescription)")
    }
    return nil
}
