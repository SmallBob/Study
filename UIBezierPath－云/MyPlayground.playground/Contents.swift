//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
func randomInt(lower lower:Int,upper : Int) -> Int{

    assert(lower < upper)
    return lower + Int(arc4random_uniform(UInt32(upper - lower)))


}

func circle(at center:CGPoint ,radius:CGFloat)->UIBezierPath{

    return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)

}

let a = Double(randomInt(lower: 70, upper: 100))

    let b = Double(randomInt(lower: 10, upper: 35))
    let ndiv = 12 as Double

let points = (0.0).stride(to: 1.0, by: 1/ndiv).map { CGPoint(x: a * cos(2 * M_PI * $0), y: b * sin(2 * M_PI * $0))}


let path = UIBezierPath()
path.moveToPoint(points[0])


for point in points[1..<points.count]{
    path.addLineToPoint(point)
}

path.closePath()

let minRadius = (Int)(M_PI * a/ndiv)
let maxRadius = minRadius + 25
for point in points[0..<points.count]
{
    let randomRadius = CGFloat(randomInt(lower: minRadius, upper: maxRadius))
    let circ = circle(at: point, radius: randomRadius)
    path.appendPath(circ)

}

path

*/

let outie_coords: [(x: CGFloat, y: CGFloat)] = [(1.0/9, 0), (2.0/9, 0), (1.0/3, 0), (37.0/60, 0), (1.0/6, 1.0/3), (1.0/2, 1.0/3), (5.0/6, 1.0/3), (23.0/60, 0), (2.0/3, 0), (7.0/9, 0), (8.0/9, 0), (1.0, 0)]

let size: CGFloat = 100
let outie_points = outie_coords.map { CGPointApplyAffineTransform(CGPointMake($0.x, $0.y), CGAffineTransformMakeScale(size, size)) }


let path = UIBezierPath()
path.moveToPoint(CGPointZero)

for i in 0.stride(through: outie_points.count - 3, by: 3) {
    path.addCurveToPoint(outie_points[i+2], controlPoint1: outie_points[i], controlPoint2: outie_points[i+1])
}

path
let transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(CGFloat(-M_PI/2)), 0, size)

let temppath = path.copy() as! UIBezierPath

let foursided = UIBezierPath()
for i in 0...3 {
    temppath.applyTransform(transform)
    foursided.appendPath(temppath)

}

foursided


enum Edge {
    case Outie
    case Innie
    case Flat
}

func jigsawPieceMaker(size size: CGFloat, edges: [Edge]) -> UIBezierPath {

    func incrementalPathBuilder(firstPoint: CGPoint) -> ([CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        path.moveToPoint(firstPoint)
        return {
            points in
            assert(points.count % 3 == 0)
            for i in 0.stride(through: points.count - 3, by: 3) {
                path.addCurveToPoint(points[i+2], controlPoint1: points[i], controlPoint2: points[i+1])
            }

            return path
        }
    }


    let outie_coords: [(x: CGFloat, y: CGFloat)] = [/*(0, 0), */ (1.0/9, 0), (2.0/9, 0), (1.0/3, 0), (37.0/60, 0), (1.0/6, 1.0/3), (1.0/2, 1.0/3), (5.0/6, 1.0/3), (23.0/60, 0), (2.0/3, 0), (7.0/9, 0), (8.0/9, 0), (1.0, 0)]

    let outie_points = outie_coords.map { CGPointApplyAffineTransform(CGPointMake($0.x, $0.y), CGAffineTransformMakeScale(size, size)) }
    let innie_points = outie_points.map { CGPointMake($0.x, -$0.y) }
    let flat_points = outie_points.map { CGPointMake($0.x, 0) }

    var shapeDict: [Edge: [CGPoint]] = [.Outie: outie_points, .Innie: innie_points, .Flat: flat_points]


    let transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(CGFloat(-M_PI/2)), 0, size)
    let path_builder = incrementalPathBuilder(CGPointZero)
    var path: UIBezierPath!
    for edge in edges {
        path = path_builder(shapeDict[edge]!)

        for (e, pts) in shapeDict {
            let tr_pts = pts.map { CGPointApplyAffineTransform($0, transform) }
            shapeDict[e] = tr_pts
        }
    }

    path.closePath()
    return path
}


let piece1 = jigsawPieceMaker(size: 100, edges: [.Innie, .Outie, .Flat, .Innie])

let piece2 = jigsawPieceMaker(size: 100, edges: [.Innie, .Innie, .Innie, .Innie])
piece2.applyTransform(CGAffineTransformMakeRotation(CGFloat(M_PI/3)))



