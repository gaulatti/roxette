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

  @Published var currentTitle: String = "Sample MP3 from nowhere (circa 2001)"
  @Published var currentTime: TimeInterval = 0
  @Published var duration: TimeInterval = 0
  @Published var isPlaying: Bool = false

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

  private func setupTimeObserver() {
    let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    timeObserver = audioPlayer.addPeriodicTimeObserver(
      forInterval: interval, queue: DispatchQueue.main
    ) { [weak self] time in
      self?.currentTime = time.seconds
      if let duration = self?.audioPlayer.currentItem?.duration.seconds {
        self!.duration = duration
      }
    }
  }

  func setupNowPlaying() {
    var nowPlayingInfo = [String: Any]()
    nowPlayingInfo[MPMediaItemPropertyTitle] = currentTitle

    MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
  }

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
  }

  func play() {
    audioPlayer.play()
    isPlaying = true
  }

  func pause() {
    audioPlayer.pause()
    isPlaying = false
  }

  func seek(to time: TimeInterval) {
    let targetTime = CMTime(seconds: time, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    audioPlayer.seek(to: targetTime)
  }

  private func updateNowPlayingInfo() {
    var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo ?? [String: Any]()
    nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
    nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = duration

    MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
  }
}
