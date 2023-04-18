//
//  ViewController.swift
//  WordGarden-UIKIt
//
//  Created by Students on 06.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var wordsInGameLabel: UILabel!
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    var wordsToGuess = ["swift", "cat", "dog"]
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = guessedLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        
        wordToGuess = wordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = String(repeating: "_ ", count: wordToGuess.count-1) + "_" // initialized label/textField -> then we can use force unwrap
    }
    
    // event: Primary Aciton Triggered
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        // dismiss the keyboard when press the Done on the keyboard
        updateUIAfterGuess()
    }
    
    // event: Editing changes
    @IBAction func guessLeterFieldChanges(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !sender.text!.isEmpty
        
        //        if let lastLetter = guessedLetterField.text!.last {
        //            guessedLetterField.text = String(lastLetter)
        //            guessLetterButton.isEnabled = true
        //        } else {
        //            guessedLetterField.text = String("")
        //            guessLetterButton.isEnabled = false
        //        }
    }
    
    func formatRevealedWord() {
        var revealedWord = ""
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += "\(letter) "
            } else {
                revealedWord += "_ "
            }
        }
        revealedWord.removeLast()
        wordBeingRevealedLabel.text = revealedWord
    }
    
    func guessALetter() {
        let letter = guessedLetterField.text!
        lettersGuessed += letter.lowercased() // because wordsToGuess all lower cased
        
        formatRevealedWord()
    }
    
    // event: Touch Up Inside
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        
        // dismiss the keyboard when press the button on the screen
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        guessALetter()
        
        updateUIAfterGuess()
    }
    
    
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
        guessLetterButton.isEnabled = false
    }
    
}

