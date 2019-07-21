//
//  TrackCell.swift
//  Apple Music Swiftbook
//
//  Created by Алексей Пархоменко on 21/07/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SDWebImage

class TrackCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCell"
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func set(track: Track) {
        trackNameLabel.text = track.trackName
        artistNameLabel.text = track.artistName
        albumNameLabel.text = track.collectionName
        guard let url = URL(string: track.artworkUrl100 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    
}
