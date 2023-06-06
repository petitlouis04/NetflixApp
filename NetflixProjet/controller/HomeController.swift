//
//  HomeController.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//
import SwiftUI
import UIKit
import Foundation

//request to catch the movie by the identifiant
func catchMovies(idFilm:Int) async -> ResponseFilm?{
    let apiUrl = URL(string: "https://api.themoviedb.org/3/movie/" + String(idFilm) + "?api_key=9a8f7a5168ace33d2334ba1fe14a83fb&append_to_response=videos")!
    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, response) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(ResponseFilm.self, from:data)
        return responseFilm
        
    } catch {
        print("Erreur : \(error.localizedDescription)")
    }
    return nil
}

//request to catch the trailer by a id
func bandeAnnonce(videos:[VideoType]){
    @Environment(\.openURL) var openURL;
    
    let trailer = videos.filter{ $0.type?.lowercased() == "trailer"}
    if let url = trailer.first{
        let trailerKey = url.key
        print(trailerKey)
        if let trailerBon = trailerKey{
            openURL(URL(string: "https://www.youtube.com/watch?v=" + trailerBon )!)
        }
        
    }
    
}

