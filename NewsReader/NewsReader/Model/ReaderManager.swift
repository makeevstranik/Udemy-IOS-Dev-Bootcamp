//
//  ReaderManager.swift
//  NewsReader
//
//  Created by Евгений Макеев on 09.02.2022.
//

import Foundation

class ReaderManager: ObservableObject {
    
    let queryService = QueryService()
    
    @Published var posts = [Post]()
    
    func fetchData() {
        queryService.getQuery(callback: { [weak self] dataParsed, error in
            
            guard let data = dataParsed else {
                print("dataParsed Error")
                return
            }
            guard error.isEmpty else {
                print("Error --> \(error)")
                return
            }
            DispatchQueue.main.async {
                self?.posts = data.hits
            }
        })
    }
}
