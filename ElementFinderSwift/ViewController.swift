//
//  ViewController.swift
//  ElementFinderSwift
//
//  Created by Gemma Shearer on 21/11/2015.
//  Copyright © 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets for UI elements
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enterElement: UITextField!
    @IBOutlet weak var massNumberLabel: UILabel!
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var findMyElementButton: UIButton!
    
    //variables which act as parameters for the updateUI function and allow the UILabels to be updated depending on which element has been entered
    
    var element: String?
    var symbol = " "
    var massNumber = " "
    var atomicNumber = " "
    var elementName = " "
    var unwrappedElement = " "
    
    
    // variables for the color scheme including the colors
    var colorSchemeInteger:Int = 0
    var pinkUI = UIColor(red: 247/255, green: 116/255, blue: 199/255, alpha: 1.0)
    var orangeUI = UIColor(red: 247/255, green: 165/255, blue: 116/255, alpha: 1.0)
    var blueUI = UIColor(red: 116/255, green: 199, blue: 247, alpha: 1.0)
    var purpleUI = UIColor(red: 230/255, green: 116/255, blue: 247/255, alpha: 1.0)
    
 
    //function tp update the UILabels depending on the parameters set by the case
    func updateUI(symbol: String, massNumber: String, atomicNumber: String, elementName: String){
       massNumberLabel.text = massNumber
       elementSymbolLabel.text = symbol
       atomicNumberLabel.text = atomicNumber
       elementNameLabel.text = elementName
       elementNameLabel.hidden = false
    }
    
    //function to change the color of the UI elements based on a random number generated when the findMyElement button is pressed
    func changeColorScheme() {
    //this can probably call another function that has the uicolor as a parameter
        colorSchemeInteger = Int(arc4random_uniform(100))
        print(colorSchemeInteger)
        
        if colorSchemeInteger <= 25 {
            elementSymbolLabel.backgroundColor = pinkUI
            elementNameLabel.textColor = pinkUI
            findMyElementButton.backgroundColor = pinkUI
            titleLabel.shadowColor = pinkUI
            
        } else if colorSchemeInteger <= 50 {
            elementSymbolLabel.backgroundColor = orangeUI
            elementNameLabel.textColor = orangeUI
             findMyElementButton.backgroundColor = orangeUI
            titleLabel.shadowColor = orangeUI
            
        } else if colorSchemeInteger <= 75 {
            elementSymbolLabel.backgroundColor = blueUI
            elementNameLabel.textColor = blueUI
             findMyElementButton.backgroundColor = blueUI
            titleLabel.shadowColor = blueUI
            
        } else {
            elementSymbolLabel.backgroundColor = purpleUI
            elementNameLabel.textColor = purpleUI
             findMyElementButton.backgroundColor = purpleUI
            titleLabel.shadowColor = purpleUI
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//contains the main logic that runs when the button is pressed. Takes the string entered into the text field (which can either be the elements name or chemical symbol then evaluates this and calls the uodateUI function with he relevant parameters in it. This also calls the changeColorScheme function
    
    @IBAction func findMyElementButtonTapped(sender: UIButton) {
        
        //problem - the first responder has resigned but I need to get it back again
       enterElement.resignFirstResponder()
        changeColorScheme()
        
        if enterElement.text != nil {
            element = enterElement.text!
            unwrappedElement = element!
            //do I need to convert the string to lowercase?
        }
        
        else {
            //do an alert which tells them they haven't entered an element
        }
        
        //switch that evaluates the element entered
        switch  unwrappedElement {
        case "hydrogen", "h":
            updateUI("H", massNumber: "1.0", atomicNumber: "1", elementName: "Hydrogen")
             resignFirstResponder()
        case "helium", "he":
            updateUI("He", massNumber: "4.0", atomicNumber: "2", elementName: "Helium")
        case "lithium", "li":
            updateUI("Li", massNumber: "6.9", atomicNumber: "3", elementName: "Lithium")
        default:
            
            updateUI("X", massNumber: "A", atomicNumber: "Z", elementName: "That's not an element")
            showAlert()
            //instead of this it will show an alert
        }
        
        
    }

    func showAlert() {
    let alert = UIAlertController(title: "Oops", message: "That's not an element in this universe", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Try Again", style: .Default, handler: nil)
        
    alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
   
}

