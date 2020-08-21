//
//  Copyright (c) 2020 Jerel Rocktaschel. All rights reserved.
//

protocol ArtistTableViewCellPresentable {
    var artistModel: ArtistModel { get set }
}

extension ArtistTableViewCellPresentable {
    func getArtistName(from artistModel: ArtistModel) -> String? {
        guard let name = artistModel.name else {
            return nil
        }
        return name
    }
    
    func getArtistInfo(from artistModel: ArtistModel) -> String? {
        guard let info = artistModel.info else {
            return nil
        }
        return info
    }
    
    func getArtistImageName(from artistModel: ArtistModel) -> String? {
        guard let image = artistModel.image else {
            return nil
        }
        return image
    }
}

struct ArtistTableCellViewModel: ArtistTableViewCellPresentable {
    
    //MARK: Internal Properties
    
    var artistModel: ArtistModel

    //MARK: Init
    
    init(with artistModel: ArtistModel) {
        self.artistModel = artistModel
    }
}
