//
//  Copyright (c) 2020 Jerel Rocktaschel. All rights reserved.
//

import Foundation

typealias GetArtistsCompletion = (_ artists: [ArtistModel]?, _ error: Error?)->()

//MARK: Protocol

protocol ArtistNetworkService {
    func getArtists(completion: @escaping GetArtistsCompletion)
}

//MARK: ArtistNetworkService

struct ArtistService: ArtistNetworkService {
    func getArtists(completion: @escaping GetArtistsCompletion) {
        let fileName = "artists"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ArtistsResponseData.self, from: data)
                completion(jsonData.artists, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
