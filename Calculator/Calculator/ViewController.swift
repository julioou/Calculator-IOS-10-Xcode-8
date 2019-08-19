//
//  ViewController.swift
//  Calculator
//
//  Created by Just Study on 8/18/19.
//  Copyright © 2019 Just Study. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOfScreen = Double(label.text!)!
            performingMath = false
        } else
        {
        label.text = label.text! + String(sender.tag-1)
        numberOfScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text! != "" && sender.tag != 11 && sender.tag != 16
        {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12{ //Divide
                label.text = "/"
            } else if sender.tag == 13{ //Multiplay
                label.text = "X"
            } else if sender.tag == 14{ //Minus
                label.text = "-"
            } else if sender.tag == 15{ //Plus
                label.text = "+"
                
            }
            performingMath = true
            operation = sender.tag
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOfScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOfScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOfScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOfScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOfScreen = 0;
            operation = 0;
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


}

