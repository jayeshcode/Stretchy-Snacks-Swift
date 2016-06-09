//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Jayesh Wadhwani on 2016-06-09.
//  Copyright © 2016 Jayesh Wadhwani. All rights reserved.
//

import UIKit
import CoreGraphics
@objc protocol NewMenuItemHandling {
     func btnclicked(sender: UIButton!)
    

}
class ViewController: UIViewController {

    @IBOutlet var MyView: UIView!
    @IBOutlet weak var heightMyView: NSLayoutConstraint!
    
    
    @IBOutlet weak var add: UIButton!
    let stackView   = UIStackView()
    
     var data = [String]()
    var stretched = false
    
    let kHeightShort: CGFloat = 66
    let kHeightLong: CGFloat = 200
    var i:Int = 1
    var oreosButton = UIButton()
    var pizzaPocketButton = UIButton()
    var popTartsButton = UIButton()
    var popsicleButton = UIButton()
    var ramenButton = UIButton()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.hidden = true
        
        oreosButton.addTarget(self, action: #selector(NewMenuItemHandling.btnclicked(_:)), forControlEvents: .TouchUpInside)
        pizzaPocketButton.addTarget(self, action: #selector(NewMenuItemHandling.btnclicked(_:)), forControlEvents: .TouchUpInside)
        popTartsButton.addTarget(self, action: #selector(NewMenuItemHandling.btnclicked(_:)), forControlEvents: .TouchUpInside)
        popsicleButton.addTarget(self, action: #selector(NewMenuItemHandling.btnclicked(_:)), forControlEvents: .TouchUpInside)
        ramenButton.addTarget(self, action: #selector(NewMenuItemHandling.btnclicked(_:)), forControlEvents: .TouchUpInside)
        
        
        oreosButton.setImage(UIImage(named: "oreos"), forState: .Normal)
        pizzaPocketButton.setImage(UIImage(named: "pizza_pockets"), forState: .Normal)
        popTartsButton.setImage(UIImage(named: "pop_tarts"), forState: .Normal)
        popsicleButton.setImage(UIImage(named: "popsicle"), forState: .Normal)
        ramenButton.setImage(UIImage(named: "ramen"), forState: .Normal)
        
        
        stackView.addArrangedSubview(oreosButton)
        stackView.addArrangedSubview(pizzaPocketButton)
        stackView.addArrangedSubview(popTartsButton)
        stackView.addArrangedSubview(popsicleButton)
        stackView.addArrangedSubview(ramenButton)
        
        MyView.addSubview(stackView)
        
        func action(sender: UIButton) {
            // Do whatever you need when the button is pressed
        }
        
        let leadingConstriant = stackView.leadingAnchor.constraintEqualToAnchor(MyView.leadingAnchor, constant: 20)
        let trailingConstriant = stackView.trailingAnchor.constraintEqualToAnchor(MyView.trailingAnchor, constant: -20)
        let heightConstriant = stackView.heightAnchor.constraintEqualToConstant(100)
        let topConstriant = stackView.topAnchor.constraintEqualToAnchor(MyView.topAnchor, constant: 80)
        
        NSLayoutConstraint.activateConstraints([leadingConstriant, trailingConstriant, heightConstriant, topConstriant])
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func btnclicked(sender: UIButton!)
    {
        switch sender {
        case oreosButton:
            data.insert("Oreos", atIndex: 0)
            
        case pizzaPocketButton:
           data.insert("Pizza Pockets", atIndex: 0)
            
        case popTartsButton:
           data.insert("Pop Tarts", atIndex: 0)
            
        case popsicleButton:
           data.insert("Popsicle", atIndex: 0)
            
        case ramenButton:
            data.insert("Ramen", atIndex: 0)
            
        default:
            print("Other")
        }
        tableView.reloadData()
        
    }
 
    
func actionOnButton(sender: UIButton) {
    
    
    stretched = !stretched
    stackView.hidden = !stretched
    heightMyView.constant = stretched ? kHeightLong : kHeightShort
    
    // stackView.hidden=stretched
    let angle = self.stretched ? CGFloat(M_PI_4) : 0
    sender.transform = CGAffineTransformMakeRotation(angle)
    
    
    
    UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: [], animations: {
        
        self.MyView.layoutIfNeeded()
        
        
    }) {
        _ in
        
        
        
        
    }
    
    
    
    
    
}



    // Tableview Methods


    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {return 1}
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {return data.count}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
    
    
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }


    
}

