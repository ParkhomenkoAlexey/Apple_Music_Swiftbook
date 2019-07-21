//
//  AlbumCell.swift
//  Apple Music Swiftbook
//
//  Created by Алексей Пархоменко on 22/07/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(track: Track) {
        albumNameLabel.text = track.collectionName
        artistNameLabel.text = track.artistName
        albumNameLabel.text = track.collectionName
        guard let url = URL(string: track.artworkUrl100 ?? "") else { return }
        albumImageView.sd_setImage(with: url, completed: nil)
        
    }
    
}
