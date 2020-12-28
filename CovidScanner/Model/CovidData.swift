//
//  CovidData.swift
//  CovidScanner
//
//  Created by Amron Berhanu on 12/27/20.
//

import Foundation

//    let dateFormatter = DateFormatter()

struct CovidData:Decodable {
    
//    struct Message : Codable {}
//    let message: Message
//
//    struct Global : Codable {}
//    let global: Global
    
    
     let Countries: [Countries]
    

//    let Date: (DateFormat

//    //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
}

struct Countries: Decodable {
    let Country: String
    let TotalConfirmed: Int
    let TotalDeaths: Int
}

struct Global: Decodable {
    let TotalConfirmed: Int
    let TotalDeaths: Int
}


