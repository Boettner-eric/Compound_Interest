//
//  ViewController.swift
//  Compound Interest
//
//  Created by Eric Boettner on 8/3/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result_four: UILabel!
    @IBOutlet weak var result_three: UILabel!
    @IBOutlet weak var result_one: UILabel!
    @IBOutlet weak var result_two: UILabel!
    @IBOutlet weak var Data: UILabel!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var period: UIButton!
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var enter: UIButton!    
    @IBOutlet weak var c: UIButton!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var question: UIButton!
    @IBOutlet weak var slash: UIButton!
    
    var numbers: String = ""
    var state: Int = 0
    var years: Float = 0.0
    var cost: Float = 0.0
    var rate: Float = 0.0
    var frequency: Float = 0.0
    
    override func viewDidLoad() {
        Data.text = ""
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "escher_grid")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(_ sender: Any) {
        Data.text = ""
        numbers = ""
    }
    
    @IBAction func del(_ sender: Any) {
        numbers = Data.text!
        if numbers != "" {
        let endIndex = numbers.index(numbers.endIndex, offsetBy: -1)
        
        let truncated = numbers.substring(to: endIndex)
        Data.text = truncated
        numbers = truncated
    }
    }
    @IBAction func zero_press(_ sender: Any) {
        numbers += "0"
        Data.text = numbers
    }
    
    
    @IBAction func period_press(_ sender: Any) {
        let charset = CharacterSet(charactersIn: ".")
        if numbers.rangeOfCharacter(from: charset) != nil {
            print("attempt to use multiple decimal points")
        }
        else {
            if Data.text == "" {
                numbers += "0."
                Data.text = numbers
            }
            else {
            numbers += "."
            Data.text = numbers
            }
        }
        
    }
    
    @IBAction func one_press(_ sender: Any) {
        numbers += "1"
        Data.text = numbers
    }
    
    @IBAction func two_press(_ sender: Any) {
        numbers += "2"
        Data.text = numbers
    }
    
    @IBAction func three_press(_ sender: Any) {
        numbers += "3"
        Data.text = numbers
    }
    @IBAction func four_press(_ sender: Any) {
        numbers += "4"
        Data.text = numbers
    }
   
    @IBAction func five_press(_ sender: Any) {
        numbers += "5"
        Data.text = numbers
    }
    @IBAction func six_press(_ sender: Any) {
        numbers += "6"
        Data.text = numbers
    }
    @IBAction func seven_press(_ sender: Any) {
        numbers += "7"
        Data.text = numbers
    }
    @IBAction func eight_press(_ sender: Any) {
        numbers += "8"
        Data.text = numbers
    }
    
    @IBAction func nine_press(_ sender: Any) {
        numbers += "9"
        Data.text = numbers
    }
    
    @IBAction func enter_press(_ sender: Any) {
        switch state {
        case 0:
                result_one.text = numbers
                print("cost : " + numbers)
                state += 1
                numbers = ""
                Data.text = ""
                prompt.text = " Enter number of years"

        case 1:
                result_two.text = numbers
                print("years : " + numbers)
                state += 1
                numbers = ""
                Data.text = ""
                prompt.text = " Frequency compounded"
        case 2:
            result_four.text = numbers
            print("compounded : " + numbers)
            state += 1
            numbers = ""
            Data.text = ""
            prompt.text = " Enter interest rate"
        case 3:
            result_three.text = numbers
            if let rate = Float(numbers) {
                if let years = Float(result_two.text!)
                {
                 if let cost = Float(result_one.text!)
                 {
                    if let frequency = Float(result_four.text!)
                    {
                        numbers = ""
                        Data.text = ""
                        prompt.text = " Enter price"
                        print("")
                        print(String(cost) + " " + String(rate) + " " + String(years) + " " + String(frequency))
                        let step_one: Float = 1 + (rate/frequency)
                        print(step_one)
                        let step_two: Float = years * frequency
                        print(step_two)
                        let tmp = cost * powf(step_one,step_two)
                        result.text = "$ " + String(tmp)
                        state = 0
                    }
                }
                }
            }
            else
            {
                print("error with float 2")
            }
        default:
            print("?")
        }
        
    }
    @IBAction func cancel_press(_ sender: Any) {
        numbers = ""
        Data.text = ""
        prompt.text = " Enter price"
        state = 0
        result.text = ""
        result_one.text = ""
        result_two.text = ""
        result_four.text = ""
        result_three.text = ""
    }
    
}

