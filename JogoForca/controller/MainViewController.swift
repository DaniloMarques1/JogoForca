//
//  ViewController.swift
//  JogoForca
//
//  Created by IFPB on 16/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var lbSecret: UILabel!
    
    @IBOutlet weak var lbDica: UILabel!
    
    @IBOutlet weak var lbAvailableLetters: UILabel!
    
    @IBOutlet weak var lbTries: UILabel!
    
    
    @IBOutlet weak var tfGuess: UITextField!
    
    
    @IBOutlet weak var lbResult: UILabel!
    
    var hangman: Hangman!
    var name: String!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hangman = Hangman()
        self.atualizarInterface()
    }
    
    func atualizarInterface() {
        print("Atualizando...")
        self.name = self.hangman.randomName()
        print(self.name)
        self.lbSecret.text = self.hangman.secretWord(name: self.name)
        self.lbAvailableLetters .text = self.hangman.availableLetters
        self.lbTries.text = "Tentativas: \(self.hangman.tries)"
        self.lbDica.text = "Pensei em um nome com \(self.name.count) letras"
        
    }

    @IBAction func jogar(_ sender: Any) {
        
        if self.hangman.tries > 0 {
         let guess = self.tfGuess.text!
            if self.hangman.isGuessCorrect(guess: guess, name: self.name) {
                self.hangman.updateAvailableLetters(guess: guess)
                self.lbAvailableLetters.text = self.hangman.availableLetters
                
                if self.hangman.didIWin(name: name) {
                    // TODO melhorar pra instanciar apenas uma vez
                    let resultController = self.storyboard?.instantiateViewController(identifier: "view_result") as! ResultadoViewController
                    resultController.resultado = "Parabéns, você ganhou!"
                    self.hangman = Hangman()
                    self.atualizarInterface()
                    self.present(resultController, animated: true, completion: nil)
                }
                
            } else {
                self.hangman.tries -= 1
                self.lbTries.text = "Tentativas restantes: \(self.hangman.tries)"
            }
            
            self.lbSecret.text = self.hangman.secretWord(name: self.name)
        } else {
            let resultController = self.storyboard?.instantiateViewController(identifier: "view_result") as! ResultadoViewController
            resultController.resultado = "Você perdeu :( nome correto seria \(self.name ?? "")."
            self.hangman = Hangman()
            self.atualizarInterface()
            self.present(resultController, animated: true, completion: nil)
        }
        
        self.tfGuess.text = ""
    }
    
    
}
