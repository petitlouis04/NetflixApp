//
//  ContentView.swift
//  NetflixProjet
//
//  Created by digital on 04/04/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var mouvie:ResponseFilm? = nil;
    @Environment(\.openURL) var openURL;
    
    let idFilm :Int
    init(idFilm:Int){
        self.idFilm = idFilm
    }
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .center){
                if let mouvie = self.mouvie{
                    
                    //part that displays the movie poster via the API
                    VStack(){
                        
                        AsyncImage(url:URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"+mouvie.poster_path))
                        { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image(systemName: "photo.fill")
                        }.frame(width: 300, height: 400)
                        
                        HStack(){
                            VStack(){
                                Text(mouvie.original_title)
                                    .padding(.bottom, 10.0)
                                    .font(.system(size: 25))
                                
                                
                                ScrollView(.horizontal){
                                    HStack(alignment: .center){
                                        if let genres = self.mouvie?.genres {
                                            ForEach(genres, id : \.self){
                                                category in
                                                Text(category.name )
                                                    .frame(width:100)
                                            }
                                        }
                                    }
                                }
                            }.padding(.top,20)
                            
                        }
                        
                        //part who was redirected on the trailer
                        VStack(){
                            HStack(){
                                Button("Bande d'annonce") {
                                    if let video = mouvie.videos?.results {
                                        bandeAnnonce(videos: video)
                                    }
                                    
                                }
                            }.padding(.bottom,20)
                            
                            //part who displayed the information on the movie like stars wars display
                            HStack(){
                                Text(mouvie.overview)
                                    .fontWeight(.bold)
                                
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(10)
                                
                                    .rotation3DEffect(.degrees(40), axis: (x: 1, y: 0, z: 0))
                            }.padding(.top,10).frame(width: 300,height: 250).padding(.horizontal)
                                .shadow(color: .gray, radius: 2,x:0,y:15)
                            Text("Année de parution : " + mouvie.release_date)
                                .frame(width: 250,height: 40,alignment: .center)
                            Text("Durée de film : " + String(mouvie.runtime) + " mins")
                                .frame(width: 200,height: 30,alignment: .center)
                            
                            
                        }
                        HStack(alignment: .center){
                            Text("Regarder")
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200,height:50)
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(.red))
                        }
                        
                    }
                }
            }.background(Color.white)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .onAppear{
                    Task{
                        mouvie = await catchMovies(idFilm: idFilm);
                    }
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(idFilm: 17350)
    }
}
