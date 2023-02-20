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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = guessedLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
    }

    // event: Primary Aciton Triggered
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        // dismiss the keyboard when press the Done on the keyboard
        updateUIAfterGuess()
    }
    
    // event: Editing changes
    @IBAction func guessLeterFieldChanges(_ sender: UITextField) {
        let text = guessedLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
    }
    
    // event: Touch Up Inside
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        // dismiss the keyboard when press the button on the screen
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
        guessLetterButton.isEnabled = false
    }
    
}

