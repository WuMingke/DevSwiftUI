//
//  WoodFish.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/20.
//

import AVFoundation
import SwiftUI

class WoodFishViewModel: ObservableObject {
    private var soundPlayer: AVAudioPlayer?
    private var lastResourece: String?
    private var synthesizer = AVSpeechSynthesizer()

    /// 播放
    func playAudio(forResource: String, ofType: String) {
        if soundPlayer != nil && lastResourece == forResource {
            soundPlayer?.play()
            return
        }
        guard let path = Bundle.main.path(forResource: forResource, ofType: ofType) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            lastResourece = forResource
            soundPlayer?.play()
        } catch {
            print("播放异常")
        }
    }

    func speak(words: String) {
        let utterance = AVSpeechUtterance(string: words)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.2
        utterance.volume = 1.0
        synthesizer.speak(utterance)
    }
}

struct WoodFish: View {
    @State private var isPressed = false
    private var viewModel = WoodFishViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("woodFish")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .scaleEffect(isPressed ? 0.9 : 1.0)
                //
                .onTapGesture {
                    // 播放音乐
//                    viewModel.playAudio(forResource: "woodfishmusic", ofType: "mp3")
                    // 文字转语音
                    viewModel.speak(words: "wood fish music")
                }

//                .gesture(
//                    LongPressGesture(minimumDuration: 0.1)
//                        .onChanged { _ in
//                            isPressed = true
//                        }
//                        .onEnded { _ in
//                            isPressed = false
//                        }
//                )
        }
    }
}

#Preview {
    WoodFish()
}
