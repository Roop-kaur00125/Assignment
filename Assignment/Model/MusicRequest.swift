//
//  MusicRequest.swift
//  Assignment
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import Foundation
import CoreData

enum MusicError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct MusicRequest {
    let resourceURL: URL
    init() {
        resourceURL = NSURL(string: "https://shazam.p.rapidapi.com/songs/list-recommendations?key=484129036&locale=en-US")! as URL
    }
    
    
    func fetchAPI(completion: @escaping ([Track]?, MusicError?) -> ()) {
        
        let headers = [
            "x-rapidapi-key": "42fa9a107amsh67aeb321e6dafffp1827b1jsn7ecdf17d3d62",
            "x-rapidapi-host": "shazam.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: resourceURL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if error != nil {
                completion(nil, .noDataAvailable)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(nil, .cannotProcessData)
                return
            }
            
            do {
                let musicResponse = try JSONDecoder().decode(Response.self, from: data)
                let track = musicResponse.tracks
                completion(track, .noDataAvailable)
            } catch {
                completion(nil, .cannotProcessData)
            }
        }.resume()
}
    
    func fetchListFromLocalFile() -> [Track] {

        if let url = Bundle.main.url(forResource: "MusicListResponse", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try? decoder.decode(Response.self, from: data)
                    return jsonData?.tracks ?? []
                } catch {
                    print("error:\(error)")
                }
            }
            return []
    }
}
 
