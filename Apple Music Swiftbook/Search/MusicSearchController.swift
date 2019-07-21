//
//  MusicSearchController.swift
//  Apple Music Swiftbook
//
//  Created by Алексей Пархоменко on 17/07/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import Alamofire

class MusicSearchController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var networkService = NetworkService()
    
    fileprivate var timer: Timer?
    
    var tracks = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        let nib = UINib(nibName: "TrackCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TrackCell.reuseId)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let track = tracks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseId, for: indexPath) as! TrackCell
        
        cell.set(track: track)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}



// MARK: - UISearchBarDelegate

extension MusicSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.fetchTracks(searchText: searchText) { [weak self] (searchResults) in
                self?.tracks = searchResults?.results ?? []
                searchResults?.results.map({ (track) in
                    print("wrapperType: \(track.wrapperType ?? "nil") trackName: \(track.trackName ?? "nil")")
                })
                self?.tableView.reloadData()
            }
        })
    }
}



