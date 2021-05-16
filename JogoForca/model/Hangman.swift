//
//  Hangman.swift
//  JogoForca
//
//  Created by IFPB on 16/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Hangman {
    let names: Array<String>
    var tries: Int
    var availableLetters: String
    var lettersGuessed: String
    var over: Bool

    init() {
        self.names = ["ana", "aline", "bianca", "bruno", "carlos", "danilo"]
        self.tries = 5
        self.availableLetters = "abcdefghijklmnopqrstuvwyxz" // letters that have not yet been guessed
        self.lettersGuessed = ""
        over = false
    }

    public func randomName() -> String {
        let idx = Int.random(in: 0..<names.count)
        return names[idx]
    }   

    public func isGuessCorrect(guess: String, name: String) -> Bool {
        return name.contains(Character(guess))
    }

    public func updateAvailableLetters(guess: String) {
        self.lettersGuessed += guess
        var letters = ""
        for letter in availableLetters {
            if !lettersGuessed.contains(letter) {
                letters += String(letter)
            }
        }
        
        self.availableLetters = letters
    }

    public func secretWord(name: String) -> String {
        var secret = ""
        for letter in name {
            if !lettersGuessed.contains(letter) {
                secret += "_"
            } else {
                secret += String(letter)
            }

        }

        return secret
    }

    public func didIWin(name: String) -> Bool {
        for letter in name {
            if !lettersGuessed.contains(letter) {
                return false
            }
        }
        
        return true
    }

}
