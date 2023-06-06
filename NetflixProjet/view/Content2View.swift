//
//  Content2View.swift
//  NetflixProjet
//
//  Created by digital on 22/05/2023.
//

import SwiftUI

struct Content2View: View {
    
    @State var mouvie:DataFilmResponse? = nil;
    @State var idCategory :Int?
    init(idCategory:Int?){
        self.idCategory = idCategory
    }
    @State var category:CategoryResponse? = nil;
    
    var body: some View {
        
        //view which will display the list of categories
        Text("Liste des films")
            .font(.headline)
            .multilineTextAlignment(.center)
        ScrollView(.horizontal){
            HStack{
                if let categorys = self.category?.genres {
                    ForEach(categorys, id : \.self){
                        cate in
                        if let id = cate.id, let name = cate.name{
                            Button(name){
                                self.idCategory = id
                                Task{
                                    self.mouvie = await catchFilm(idCategory: idCategory);
                                }
                            }
                            
                        }
                    }
                }
            }.onAppear{
                Task{
                    category = await catchCategory();
                }
            }
            
        }
        
        //part that will display the movies according to the chosen category
        VStack(alignment: .center){
            
            NavigationView{
                List{
                    if let movies = self.mouvie?.results {
                        ForEach(movies, id : \.self){
                            movie in
                            if let title = movie.original_title , let date = movie.release_date, let image_path = movie.poster_path, let adutle = movie.adult, let description = movie.overview, let idFilm = movie.id{
                                
                                //part that displays the movie poster via the API
                                HStack(){
                                    AsyncImage(url:URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"+image_path))
                                    { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }.frame(width: 100,
                                            height: 100)
                                    
                                    //part that will redirect to the movie poster
                                    VStack(){
                                        NavigationLink(title) {
                                            ContentView(idFilm: idFilm)
                                        }
                                        
                                        Text(date)
                                        Text(description).lineLimit(3)
                                    }
                                }.padding(30.0)
                                
                            }
                        }
                    }
                }
            }
        }.onAppear{
            Task{
                mouvie = await catchFilm(idCategory: idCategory);
            }
        }
    }
}
struct Content2View_Previews: PreviewProvider {
    static var previews: some View {
        Content2View(idCategory: nil)
    }
}

