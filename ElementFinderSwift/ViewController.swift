//
//  ViewController.swift
//  ElementFinderSwift
//
//  Created by Gemma Shearer on 21/11/2015.
//  Copyright © 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var enterElement: UITextField!
    @IBOutlet weak var massNumberLabel: UILabel!
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    
    @IBOutlet weak var elementNameLabel: UILabel!
    
    var element: String?
    var symbol = " "
    var massNumber = " "
    var atomicNumber = " "
    var elementName = " "
    var unwrappedElement = " "
    
    //need to get the resign first responder in there somewhere too
    
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
            print("I don't see an element, try again")
        }
        
        
    }

}

