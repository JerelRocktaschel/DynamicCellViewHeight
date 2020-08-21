//
//  Copyright (c) 2020 Jerel Rocktaschel. All rights reserved.
//

struct ArtistModel : Decodable {
    let name: String?
    let image: String?
    let info: String?
}

struct ArtistsResponseData: Decodable {
    let artists: [ArtistModel]
}
