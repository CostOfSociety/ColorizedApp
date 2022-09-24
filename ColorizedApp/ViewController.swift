//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Святослав on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    //MARK: Private Properties
    private var colorNumbers: [String : CGFloat] =  [
        "Red" : 0.0,
        "Green" : 0.0,
        "Blue" : 0.0
    ]
    
    private enum colorSliderName: String {
        case redSlider = "redSlider"
        case greenSlider = "greenSlider"
        case blueSlider = "blueSlider"
    }
    private let coefficientOfCornerRadius = 0.25
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBackgroundColor()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupColorView()
        
    }
    
    //MARK: IBAction
    
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        let roundedValue = rounding(value: sender.value)
        
        switch sender.restorationIdentifier {
        case colorSliderName.redSlider.rawValue:
            redValueLabel.text = String(roundedValue)
            colorNumbers["Red"] = CGFloat(roundedValue)
        case colorSliderName.greenSlider.rawValue:
            greenValueLabel.text = String(roundedValue)
            colorNumbers["Green"] = CGFloat(roundedValue)
        default:
            blueValueLabel.text = String(roundedValue)
            colorNumbers["Blue"] = CGFloat(roundedValue)
        }
        setupViewBackgroundColor()
    }
    // MARK: Private Functions
    
    private func setupColorView() {
        colorView.layer.cornerRadius = colorView.frame.height * coefficientOfCornerRadius
    }

    private func setupViewBackgroundColor() {
        guard let redColor = colorNumbers["Red"] else { return }
        guard let greenColor = colorNumbers["Green"] else { return }
        guard let blueColor = colorNumbers["Blue"] else { return }
       
        colorView.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1.0
        )
        
    }
    
    private func rounding(value: Float) -> Float {
        round(value * 100) / 100
    }
}
