//: Playground - noun: a place where people can play

import UIKit



//arrays
var favoriteMovies =    ["Pulp fiction", "Reservoir Dogs", "Kill Bill","Inglorious bastards" ]

var favoriteNumbers = [1,6,7,9]

favoriteMovies[0]
favoriteMovies[1] = "lock,Stock & two smoking barrels"

favoriteMovies.count        //dizideki eleman sayısını verir.
favoriteMovies.isEmpty      //dizi boşmu kontrol yapar.

favoriteMovies.append("titanic")   //yeni bir string eklemeyi sağlar dizide.
favoriteMovies.sort()            //sıralama yapar.



//dictionaries
var myFavoriteDirectors = ["pulp Fiction " : "Quantin tarantino " , "lock ,stock " :"guy richie ","the dark knight":"christopher Nolan" ]
myFavoriteDirectors ["pulp Fiction "]
myFavoriteDirectors ["lock ,stock "] =   "Mr.Richie"
myFavoriteDirectors.count

var mydictionary = ["abc" : 1 , "def" : 2,"ghe" : 3]
mydictionary ["abc"] = 15 




