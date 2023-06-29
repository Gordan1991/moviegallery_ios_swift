//
//  MovieModel.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/26/23.
//

import Foundation

struct MovieModel : Codable{
    let page:Int?
    let results: [Result]?
    let total_pages: Int?
    let total_results:Int?
}

struct Result: Codable{
    let adult:Bool?
    let backdrop_path:String?
    let genre_ids: [Int]?
    let id:Int?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let popularity:Double?
    let poster_path:String?
    let release_date:String?
    let title:String?
    let video:Bool?
    let vote_average:Double?
    let vote_count:Int?

}


struct MovieDetailModel : Codable{
    let adult:Bool?
    let backdrop_path:String?
    let belongs_to_collection:BelongsToCollectionData?
    let budget:Int?
    let genres:[genresData]?
    let homepage:String?
    let id:Int?
    let imdb_id:String?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let popularity:Double?
    let poster_path:String?
    let production_companies:[productionCompaniesData]?
    let production_countries:[productionCountriesData]?
    let release_date:String?
    let revenue:Int?
    let runtime:Int?
    let spoken_languages:[spokenLanguagesData]?
    let status:String?
    let tagline:String?
    let title:String?
    let video:Bool?
    let vote_average:Double?
    let vote_count:Int?
}

struct BelongsToCollectionData : Codable {
    let id:Int?
    let name:String?
    let poster_path:String?
    let backdrop_path:String?
}

struct genresData: Codable{
    let id: Int?
    let name: String?
}

struct productionCompaniesData: Codable{
    let id: Int?
    let logo_path: String?
    let name: String?
    let origin_country: String?
}

struct productionCountriesData: Codable{
    let iso_3166_1: String?
    let name: String?
}


struct spokenLanguagesData: Codable{
    let english_name: String?
    let iso_639_1: String?
    let name: String?
}

