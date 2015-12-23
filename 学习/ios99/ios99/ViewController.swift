//
//  ViewController.swift
//  ios99
//
//  Created by 庞博 on 15/10/8.
//  Copyright © 2015年 wk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel();
    let spring = CASpringAnimation(keyPath: "position.x")
    let button : UIButton = UIButton(type: UIButtonType.System) as UIButton;
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    
    var prevCnt : UInt = 0
    
    
    
    private func imageViewWithImage(image : UIImage) -> UIImageView{
    
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        imageView.contentMode = .ScaleAspectFit
        
        return imageView
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    @IBAction func stepperChanged(sender: UIStepper) {
        
        
        if UInt(sender.value) > prevCnt {
        
        //  let image = UIImage(named: String(format: "m%d", Int(sender.value) ))!
          
            let image : UIImage = UIImage(named: String(format: "m%d", Int(sender.value)))! as UIImage

            
        self.horizontalStackView.insertArrangedSubview(self.imageViewWithImage(image), atIndex: 0)
            
        self.verticalStackView.insertArrangedSubview(self.imageViewWithImage(image), atIndex: 0)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.horizontalStackView.layoutIfNeeded()
                self.verticalStackView.layoutIfNeeded()
                
            })
            
            
        
        
        }
        else if (prevCnt >= 1) {
        
            horizontalStackView.removeArrangedSubview(horizontalStackView.arrangedSubviews.first!)
            horizontalStackView.subviews.last?.removeFromSuperview()
            
            verticalStackView.removeArrangedSubview(verticalStackView.arrangedSubviews.first!)
            verticalStackView.subviews.last?.removeFromSuperview()

        
        }
        
        prevCnt = UInt(sender.value)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func springAnimation() {
        
        
        //UIButton(type: .System);
        button.setTitle("putong", forState: UIControlState.Normal);
        button.setTitle("chumo", forState: .Highlighted);
        button.setTitle("jinyong", forState: .Disabled);
        
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted);
        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Disabled);
        
        button.frame = CGRect(x: 10, y: 20, width: 100, height: 40);
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button);
        
        
        //let label = UILabel();
        label.frame = CGRect(x: 10, y: 100, width: 100, height: 40);
        label.text = "text";
        self.view.addSubview(label);
        
        
        
        
    }
    
    
    func buttonClick(button:UIButton){
        spring.damping = 5;
        spring.stiffness = 1000;
        spring.mass = 1;
        spring.initialVelocity = 0;
        spring.fromValue = label.layer.position.x;
        spring.toValue = label.layer.position.x + 50;
        spring.duration = spring.settlingDuration;
        
        spring.delegate = self;
        
        label.layer.addAnimation(spring, forKey: spring.keyPath);
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print(__FUNCTION__+"\n")
        button.enabled = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

