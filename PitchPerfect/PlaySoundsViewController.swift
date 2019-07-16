//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Irfan on 11/07/19.
//  Copyright © 2019 Appachhi. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb }

    @IBOutlet weak var slowBtn: UIButton!
    @IBOutlet weak var fastBtn: UIButton!
    @IBOutlet weak var highBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    @IBOutlet weak var echoBtn: UIButton!
    @IBOutlet weak var reverbBtn: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("recordedURL = \(recordedAudioURL)")
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        slowBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        fastBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        highBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        lowBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        echoBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        reverbBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        configureUI(.notPlaying )
    }

    @IBAction func playSound(_ sender: UIButton) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.9)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
    }
    
}
