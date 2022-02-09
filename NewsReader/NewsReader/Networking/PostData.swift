//
//  QueryData.swift
//  NewsReader
//
//  Created by Евгений Макеев on 09.02.2022.
//

import Foundation

struct PostData: Codable {
    
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    
    var id: String { objectID }
    let created_at: String
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
