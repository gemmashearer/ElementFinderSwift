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
    
    @IBOutlet weak var enterElement: UITextField!
    @IBOutlet weak var massNumberLabel: UILabel!
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    
    @IBOutlet weak var elementNameLabel: UILabel!
    
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
    
 
    
    func updateUI(symbol: String, massNumber: String, atomicNumber: String, elementName: String){
    //set massNumberLabel to be the mass number - need to get this from the case
        //set elementSymbolLabel to be the element symbol - need to get this from the case
        //set atomicNumberLabel to be the atomic number - get this from the case
        //these all need to be the parameters
       massNumberLabel.text = massNumber
       elementSymbolLabel.text = symbol
       atomicNumberLabel.text = atomicNumber
       elementNameLabel.text = elementName
       elementNameLabel.hidden = false
        
        
    //this function should update all the UI elements, assuming I have the parameters right
        
    }
    
    
    func changeColorScheme() {
        //generate a random number
        //change background color of the elementSymbolLabel and all the others will need to be done too due to my dodgy coding
        //change the elementNameLabel color too
        //change the button color
        
        colorSchemeInteger = Int(arc4random_uniform(13))
        print(colorSchemeInteger)
        
        if colorSchemeInteger <= 3 {
            elementSymbolLabel.backgroundColor = pinkUI
            
        } else if colorSchemeInteger <= 6 {
            elementSymbolLabel.backgroundColor = orangeUI
        } else if colorSchemeInteger <= 9 {
            elementSymbolLabel.backgroundColor = blueUI
            
        } else {
            elementSymbolLabel.backgroundColor = purpleUI
        }
    }
    
   //need to get hold of the value entered in the enterElement text field and attach it to a variable
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

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
        
        //switch here
        
        switch  unwrappedElement {
        case "hydrogen", "h":
            updateUI("H", massNumber: "1.0", atomicNumber: "1", elementName: "Hydrogen")
             resignFirstResponder()
        case "helium", "he":
            updateUI("He", massNumber: "4.0", atomicNumber: "2", elementName: "Helium")
        case "lithium", "li":
            updateUI("Li", massNumber: "6.9", atomicNumber: "3", elementName: "Lithium")
        default:
            updateUI("X", massNumber: "A", atomicNumber: "Z", elementName: "That's not an element, try again")
        }
        
        
    }

   
}

