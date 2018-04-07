//
//  GenreViewController.swift
//  MusicPlayerSample
//
//  Created by Falguni Viral Chauhan on 07/04/18.
//  Copyright © 2018 Falguni Viral Chauhan. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerApplicationController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            } else {
                print("we havn't play music due to permission issue.")
            }
        }
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    private func playGenre(genre: String) {
        //Stop previously playing song
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
