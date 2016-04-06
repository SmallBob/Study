//
//  ViewController.swift
//  yun
//
//  Created by developer_k on 16/4/6.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit


func generateRandomCloud() -> UIImage {

    func randomInt(lower lower: Int, upper: Int) -> Int {
        assert(lower < upper)
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }

    func circle(at center: CGPoint, radius: CGFloat) -> UIBezierPath {
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
    }

    let a = Double(randomInt(lower: 70, upper: 100))
    let b = Double(randomInt(lower: 10, upper: 35))
    let ndiv = 12 as Double


    let points = (0.0).stride(to: 1.0, by: 1/ndiv).map { CGPoint(x: a * cos(2 * M_PI * $0), y: b * sin(2 * M_PI * $0)) }

    let path = UIBezierPath()
    path.moveToPoint(points[0])
    for point in points[1..<points.count] {
        path.addLineToPoint(point)
    }
    path.closePath()


    let minRadius = (Int)(M_PI * a/ndiv)
    let maxRadius = minRadius + 15

    for point in points[1..<points.count] {
        let randomRadius = CGFloat(randomInt(lower: minRadius, upper: maxRadius))
        let circ = circle(at: point, radius: randomRadius)
        path.appendPath(circ)
    }

    //return path
    let (width, height) = (path.bounds.width, path.bounds.height)
    let margin = CGFloat(20)
    UIGraphicsBeginImageContext(CGSizeMake(path.bounds.width + margin, path.bounds.height + margin))


    let color = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
    let color1 = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
    let color2 = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
    UIColor.init(red: color, green: color1, blue: color2, alpha: 1).setFill()

    //UIColor.whiteColor().setFill()
    path.applyTransform(CGAffineTransformMakeTranslation(width/2 + margin/2, height/2 + margin/2))
    path.fill()
    let im = UIGraphicsGetImageFromCurrentImageContext()
    return im
}


class View: UIView {
    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        UIColor.blueColor().setFill()
        CGContextFillRect(ctx, rect)

        let cloud1 = generateRandomCloud().CGImage
        let cloud2 = generateRandomCloud().CGImage
        let cloud3 = generateRandomCloud().CGImage
        CGContextDrawImage(ctx, CGRect(x: 20, y: 20, width: CGImageGetWidth(cloud1), height: CGImageGetHeight(cloud1)), cloud1)

        CGContextDrawImage(ctx, CGRect(x: 100, y: 400, width: CGImageGetWidth(cloud2), height: CGImageGetHeight(cloud2)), cloud2)

        CGContextDrawImage(ctx, CGRect(x: 50, y: 200, width: CGImageGetWidth(cloud3), height: CGImageGetHeight(cloud3)), cloud3)
    }
}




//XCPlaygroundPage.currentPage.liveView = View(frame: CGRectMake(0, 0, 600, 800))


class ViewController: UIViewController {




    override func viewDidLoad() {
        super.viewDidLoad()

        let aview = View(frame: self.view.bounds);
        self.view.addSubview(aview);


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

