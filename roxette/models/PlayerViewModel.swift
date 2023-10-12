import AVFoundation
//
//  PlayerViewModel.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/10/23.
//
import Foundation
import MediaPlayer

class PlayerViewModel: ObservableObject {
    private var audioPlayer: AVPlayer!
    private var timeObserver: Any?
    
    @Published var currentTitle: String = "Lo estamos pasando muy bien"
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var isPlaying: Bool = false
    
    static let shared = PlayerViewModel()
    
    /**
     * This is the initializer for the PlayerViewModel class.
     * It sets up the audio session, creates the AVPlayer instance and sets up the time observer.
     * It also sets up the now playing info and the remote transport controls.
     */
    init() {
        configureAudioSession()
        guard let url = URL(string: "https://cdn.oxozon.io/prisioneros.mp3") else { return }
        audioPlayer = AVPlayer(url: url)
        
        setupTimeObserver()
        setupNowPlaying()
        setupRemoteTransportControls()
    }
    
    func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    /**
     * This method sets up the time observer for the AVPlayer instance.
     * It uses a time interval of 1 second and updates the currentTime property.
     * It also updates the duration property when the currentItem is not nil.
     */
    private func setupTimeObserver() {
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = audioPlayer.addPeriodicTimeObserver(
            forInterval: interval, queue: DispatchQueue.main
        ) { [weak self] time in
            self?.currentTime = time.seconds
            if let duration = self?.audioPlayer.currentItem?.duration.seconds {
                self!.duration = duration
            }
            self?.updateNowPlayingInfo()
        }
    }
    
    /**
     * This method sets up the now playing info for the MPNowPlayingInfoCenter.
     * It sets the title of the current item as the title of the now playing info.
     */
    func setupNowPlaying() {
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = currentTitle
        nowPlayingInfo[MPMediaItemPropertyArtist] = "Los Prisioneros"
        nowPlayingInfo[MPMediaItemPropertyAlbumTitle] = "Estadio Nacional"
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    /**
     * This method sets up the remote transport controls for the MPRemoteCommandCenter.
     * It sets up the play, pause and change playback position commands.
     */
    func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.addTarget { [unowned self] event in
            if !self.isPlaying {
                self.play()
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.isPlaying {
                self.pause()
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.changePlaybackPositionCommand.isEnabled = true
        commandCenter.changePlaybackPositionCommand.addTarget { [unowned self] event in
            if let event = event as? MPChangePlaybackPositionCommandEvent {
                self.seek(to: event.positionTime)
                return .success
            }
            return .commandFailed
        }
    }
    
    /**
     * This method plays the AVPlayer instance.
     * It also updates the now playing info.
     */
    func play() {
        audioPlayer.play()
        isPlaying = true
        updateNowPlayingInfo()
    }
    
    /**
     * This method pauses the AVPlayer instance.
     * It also updates the now playing info.
     */
    func pause() {
        audioPlayer.pause()
        isPlaying = false
        updateNowPlayingInfo()
    }
    
    /**
     * This method seeks to the specified time in the AVPlayer instance.
     * It also updates the now playing info.
     */
    func seek(to time: TimeInterval) {
        let targetTime = CMTime(seconds: time, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        audioPlayer.seek(to: targetTime)
    }
    
    /**
     * This method updates the now playing info for the MPNowPlayingInfoCenter.
     * It updates the elapsed playback time and the playback duration.
     * It also sets the artwork for the now playing info.
     */
    private func updateNowPlayingInfo() {
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo ?? [String: Any]()
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = duration
        
        if let imageToUse = UIImage(named: "roxette-g") {
            let artwork = MPMediaItemArtwork(boundsSize: imageToUse.size) { size in
                return imageToUse
            }
            nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
        } else {
            // Handle the case where the image is not found in assets
            print("Image not found in assets")
        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}
