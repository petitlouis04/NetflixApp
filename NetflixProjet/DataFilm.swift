//
//  DataFilm.swift
//  NetflixProjet
//
//  Created by digital on 17/04/2023.
//

import Foundation

class Film{
    var titre:String = "";
    var sousTitre:String = "";
    var image:String = "";
    var dateSortie:String = "";
    var dureeFilm:String = "";
    var categories:Array<String>;
    
    init(titre: String,sousTitre: String,image:String,dateSortie: String,dureeFilm: String,categories:Array<String>){
      self.titre = titre
      self.sousTitre = sousTitre
        self.image = image
      self.dateSortie = dateSortie
      self.dureeFilm = dureeFilm
      self.categories = categories
      }
}
