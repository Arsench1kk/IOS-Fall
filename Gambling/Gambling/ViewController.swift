//
//  ViewController.swift
//  Gambling
//
//  Created by Арсен Абдуҳалық on 23.10.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var leftReelImageView: UIImageView!
    @IBOutlet weak var middleReelImageView: UIImageView!
    @IBOutlet weak var rightReelImageView: UIImageView!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!

    private let symbols = [
        "symbolThree",
        "symbolFour",
        "symbolSeven",
        "symbolCoin",
        "symbolCrystal",
        "symbolCherry",
        "symbolFinger",
        "symbolToji",
        "symbolGojo"
    ]

    private var currentLeft: String = "symbolSeven"
    private var currentMiddle: String = "symbolSeven"
    private var currentRight: String = "symbolSeven"

    private var leftTimer: Timer?
    private var middleTimer: Timer?
    private var rightTimer: Timer?

    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        leftReelImageView.contentMode = .scaleAspectFit
        middleReelImageView.contentMode = .scaleAspectFit
        rightReelImageView.contentMode = .scaleAspectFit

        leftReelImageView.image = UIImage(named: currentLeft)
        middleReelImageView.image = UIImage(named: currentMiddle)
        rightReelImageView.image = UIImage(named: currentRight)

        resultLabel.text = ""
        spinButton.setTitle("LET'S GO GAMBLING", for: .normal)
    }

    @IBAction func spinButtonPressed(_ sender: UIButton) {
        startSpin()
    }

    private func startSpin() {
        if leftTimer != nil || middleTimer != nil || rightTimer != nil { return }

        spinButton.isEnabled = false
        resultLabel.text = ""

        playSound(named: "letsgo")

        leftTimer = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { [weak self] _ in
            guard let s = self else { return }
            let name = s.symbols.randomElement()!
            s.leftReelImageView.image = UIImage(named: name)
        }
        middleTimer = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { [weak self] _ in
            guard let s = self else { return }
            let name = s.symbols.randomElement()!
            s.middleReelImageView.image = UIImage(named: name)
        }
        rightTimer = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { [weak self] _ in
            guard let s = self else { return }
            let name = s.symbols.randomElement()!
            s.rightReelImageView.image = UIImage(named: name)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in self?.stopLeft() }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) { [weak self] in self?.stopMiddle() }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) { [weak self] in self?.stopRightAndResolve() }
    }

    private func stopLeft() {
        leftTimer?.invalidate(); leftTimer = nil
        currentLeft = symbols.randomElement()!
        leftReelImageView.image = UIImage(named: currentLeft)
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    private func stopMiddle() {
        middleTimer?.invalidate(); middleTimer = nil
        currentMiddle = symbols.randomElement()!
        middleReelImageView.image = UIImage(named: currentMiddle)
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    private func stopRightAndResolve() {
        rightTimer?.invalidate(); rightTimer = nil
        currentRight = symbols.randomElement()!
        rightReelImageView.image = UIImage(named: currentRight)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        let win = (currentLeft == currentMiddle) && (currentMiddle == currentRight)

        if win {
            resultLabel.text = "🎉 WIN!"
            playSound(named: "win")
            animateWin()
        } else {
            resultLabel.text = "Try again"
            playSound(named: "loose") 
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            self?.spinButton.isEnabled = true
        }
    }

    private func animateWin() {
        let views = [leftReelImageView, middleReelImageView, rightReelImageView]
        for (i, v) in views.enumerated() {
            v?.transform = .identity
            UIView.animate(withDuration: 0.26, delay: Double(i) * 0.06, options: [.curveEaseOut], animations: {
                v?.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            }, completion: { _ in
                UIView.animate(withDuration: 0.18) { v?.transform = .identity }
            })
        }
    }

    private func playSound(named name: String) {
        // tries to play <name>.mp3 from app bundle
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Audio file not found in bundle:", name)
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Audio error:", error)
        }
    }

    override var canBecomeFirstResponder: Bool { return true }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resignFirstResponder()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if spinButton.isEnabled { startSpin() }
        }
    }
}
