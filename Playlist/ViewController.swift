//
//  ViewController.swift
//  Playlist
//
//  Created by Арсен Абдухалық on 30.10.2025.
//

import UIKit
import AVFoundation

struct TrackItem {
    var fileName: String
    var tracksName: String
    var imageName: String
    var singer: String
}


class ViewController: UIViewController {
    let track: [TrackItem] = [
        TrackItem(fileName: "track1", tracksName: "Robbery", imageName: "cover1", singer: "Juice WRLD"),
        TrackItem(fileName: "track2", tracksName: "WASTED", imageName: "cover2", singer: "Juice WRLD"),
        TrackItem(fileName: "track3", tracksName: "Big City Life", imageName: "cover3", singer: "V $ X V Prince, De Lacure"),
        TrackItem(fileName: "track4", tracksName: "Big Time Rush", imageName: "cover4", singer: "Big Time Rush"),
        TrackItem(fileName: "track5", tracksName: "There's Nothing Holdin' Me Back", imageName: "cover5", singer: "Shawn Mendes"),
        TrackItem(fileName: "track6", tracksName: "Men Seni Suyemin", imageName: "cover6", singer: "Pascal"),
        TrackItem(fileName: "track7", tracksName: "Danza Kuduro", imageName: "cover7", singer: "Don Omar"),
    ]
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackSinger: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    var player: AVAudioPlayer?
    var currentIndex = 0
    
    @IBAction func previousTrack(_ sender: Any) {
        currentIndex = (currentIndex - 1 + track.count) % track.count
        playbyindex()
        
    }
    
    @IBAction func pauseandPlay(_ sender: Any) {
        if player!.isPlaying {
            player!.pause()
        } else {
            player!.play()
        }
    }
    
    @IBAction func nextTrack(_ sender: Any) {
        currentIndex = (currentIndex + 1 + track.count) % track.count
        playbyindex()
    }
    
    private func playbyindex() {
        let current = track[currentIndex]
        playSound(name: current.fileName)
        cover.image = UIImage(named: current.imageName)
        trackName.text = current.tracksName
        trackSinger.text = current.singer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playbyindex()
    }
    private func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }

}

