//
//  ViewController.swift
//  CALayer
//
//  Created by Neo on 2017/8/11.
//  Copyright © 2017年 Neo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let layer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let view = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
//        view.backgroundColor = UIColor.gray
//        self.view.addSubview(view)
        
//        print(view.frame,view.bounds)
        self.addFill()
        self.addFill1()
//        while true {
//            sleep(1)
//            btnClick(1)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func addFill(){
        let view1 = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
        view1.backgroundColor = UIColor.gray
        self.view.addSubview(view1)

        layer.lineWidth = 10
//        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        layer.backgroundColor = UIColor.red.cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 0
//        layer.borderWidth = 2
//        layer.borderColor = UIColor.red.cgColor
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
//        let path1 = UIBezierPath(roundedRect: CGRect(x: 20, y: 20, width: 90, height: 90), cornerRadius: 45)
        let path1 = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 45, startAngle: 1.5*CGFloat.pi, endAngle: 3.46*CGFloat.pi, clockwise: true)
        layer.path = path1.cgPath
        layer.lineCap = "round" //线头样式
        view1.layer.addSublayer(layer)
//        print(view.layer.mask?.frame,layer.frame)
        view1.layer.masksToBounds = true
//        print(view.layer.mask?.frame)
//        print(layer.frame,"aaaaaaa",layer.mask?.frame,"aaaaaaa",view.frame)
        let layer1 = CALayer()
        layer1.frame = CGRect(x: 200, y: 200, width: 200, height: 50)
        layer1.backgroundColor = UIColor.red.cgColor
        
        let masklayer = CALayer()
        masklayer.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        masklayer.backgroundColor = UIColor.cyan.cgColor
        masklayer.borderWidth = 2
        masklayer.borderColor = UIColor.cyan.cgColor
//        layer1.backgroundColor = UIColor.red.cgColor
        layer1.mask = masklayer
//        layer1.borderWidth = 2
//        layer1.borderColor = UIColor.cyan.cgColor
//        layer1.cornerRadius = 4
        
        self.view.layer.addSublayer(layer1)
        
        let layer2 = CAShapeLayer()
        layer2.strokeStart = 0
        layer2.strokeEnd = 0
        layer2.frame = CGRect(x: 50, y: 0, width: 100, height: 100)
        layer2.backgroundColor = UIColor.cyan.cgColor

        
        let path2 = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 50, startAngle: 1.5*CGFloat.pi, endAngle: 3.46*CGFloat.pi, clockwise: true)
        layer2.path = path2.cgPath
        view1.layer.addSublayer(layer2)
    }
    func addFill1(){
        let gra = CAGradientLayer()
        gra.backgroundColor = UIColor.gray.cgColor
        gra.colors = [UIColor.red.cgColor,UIColor.green.cgColor]
        gra.locations = [0.3,1]
        gra.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gra.position = self.view.center
        gra.startPoint = CGPoint(x: 1, y: 0)
        gra.endPoint = CGPoint(x: 0, y: 1)
        gra.mask = layer//  通过mask属性来截取渐变曾
//         let path1 = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 45, startAngle: 1.5*CGFloat.pi, endAngle: 3.46*CGFloat.pi, clockwise: true)
        self.view.layer.addSublayer(gra)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var an : CABasicAnimation!
    @IBAction func btnClick(_ sender: Any) {
        an = CABasicAnimation(keyPath: "strokeEnd")
        an.duration = 1
        an.fromValue = 0
        an.toValue = 1
        an.delegate = self
        an.isRemovedOnCompletion = false
        an.fillMode = kCAFillModeBackwards
//        an.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        an.timingFunction = CAMediaTimingFunction(controlPoints: 0.17, 0.76, 0.71, 0.15)
        self.layer.add(an, forKey: "asd")
    }
    var an1 : CABasicAnimation!
    func addFill12() {
        an1 = CABasicAnimation(keyPath: "strokeStart")
        an1.duration = 1
        an1.fromValue = 0
        an1.toValue = 1
        an1.delegate = self
        an1.isRemovedOnCompletion = false
        an1.fillMode = kCAFillModeBackwards
        an1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        self.layer.add(an1, forKey: "asdaa")
    }
}
extension ViewController : CAAnimationDelegate{
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let aa = self.layer.animation(forKey: "asd"),anim == aa{
            self.addFill12()
        }else{
            layer.removeAllAnimations()
//            layer.strokeEnd = 0
//            layer.strokeStart = 0
            self.btnClick(1)
        }
    }
}

