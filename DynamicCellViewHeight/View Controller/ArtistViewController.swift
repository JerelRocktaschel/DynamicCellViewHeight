//
//  Copyright (c) 2020 Jerel Rocktaschel. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    //MARK: Internal Properties
    
    @IBOutlet private weak var artistTableView: UITableView!
    var artistNetworkService: ArtistNetworkService!
    private var artists = [ArtistModel]()
    private let artistTableViewCellName = String.init(describing: ArtistTableViewCell.self)
    
    //MARK: View Controller Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistNetworkService.getArtists { [unowned self] artists, error in
            guard error == nil else {
                print("error:\(error!)")
                return
            }
        
            guard let artistsList = artists else {
                print("no artists")
                return
            }
            
            self.artists = artistsList
            
            DispatchQueue.main.async{
                self.artistTableView.reloadData()
            }
        }
    }
}

extension ArtistViewController: UITableViewDataSource {
    
    // MARK: - Table view data source protocol

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: artistTableViewCellName, for: indexPath) as! ArtistTableViewCell
        let artist = artists[indexPath.row]
        let artistTableCellViewModel = ArtistTableCellViewModel(with: artist)
        cell.configureCell(with: artistTableCellViewModel)
        return cell
    }
}
