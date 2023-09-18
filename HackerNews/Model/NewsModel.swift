//
//  NewsModel.swift
//  HackerNews
//
//  Created by Austin Xu on 2023/9/12.
//

import Foundation

struct NewsViewModel: Codable{
    let hits: [NewsModel]
}

struct NewsModel: Identifiable, Codable{
    var id: String{
        return objectID
    }
    let objectID: String
    let author: String
    let title: String
    let url: String?
    let points: Int
}
