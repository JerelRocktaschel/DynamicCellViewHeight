//
//  Copyright (c) 2020 Jerel Rocktaschel. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    //MARK: Internal Properties
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistInfoLabel: UILabel!
    @IBOutlet weak var artistImageHeightConstraint: NSLayoutConstraint!

    //MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
     //MARK: Public functions
     
     public func configureCell(with presenter: ArtistTableViewCellPresentable) {
        let imageName = presenter.getArtistImageName(from: presenter.artistModel)
        if let imageName = imageName {
            configureImage(imageName: imageName)
        }
        artistNameLabel.text = presenter.getArtistName(from: presenter.artistModel)
        artistInfoLabel.text = presenter.getArtistInfo(from: presenter.artistModel)
     }
    
    //MARK: Private functions
    
    private func configureImage(imageName: String) {
        if let artistImage = UIImage(named: imageName) {
            let heightRatio = artistImage.size.height / artistImage.size.width
            let newImageHeight = heightRatio *  UIScreen.main.bounds.width
            artistImageHeightConstraint.constant = newImageHeight
            artistImageView.image = artistImage
            artistImageView.layoutIfNeeded()
        }
    }
}
