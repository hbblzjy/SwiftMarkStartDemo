//
//  ViewController.swift
//  SwiftMarkStartDemo
//
//  Created by healthmanage on 16/12/5.
//  Copyright © 2016年 healthmanager. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BHClickMarkStarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nameArr:NSArray = ["描述相符","服务态度","发货速度"]
        
        //有文字描述的
        for i in 0...2 {
            let nameL = UILabel.init(frame: CGRect.init(x: 0, y: 60+60*CGFloat(i), width: 100, height: 60))
            nameL.text = nameArr[i] as? String
            nameL.textAlignment = NSTextAlignment.center;
            nameL.font = UIFont.systemFont(ofSize: 15)
            nameL.adjustsFontSizeToFitWidth = true
            self.view.addSubview(nameL)
            //有文字描述的
            let bhMarkSV = BHMarkStarView.init(frame: CGRect.init(x: 100, y: 60+60*CGFloat(i), width: self.view.frame.size.width-100, height: 60), numStar: 5, starTypeE: .TextType)
            bhMarkSV.backgroundColor = UIColor.cyan
            bhMarkSV.tag = i+1
            bhMarkSV.delegateStar = self
            self.view.addSubview(bhMarkSV)
        }
        
        //无文字描述的
        for i in 0...2 {
            let nameL = UILabel.init(frame: CGRect.init(x: 0, y: 260+50*CGFloat(i), width: 100, height: 50))
            nameL.text = nameArr[i] as? String
            nameL.textAlignment = NSTextAlignment.center
            nameL.font = UIFont.systemFont(ofSize: 15)
            nameL.adjustsFontSizeToFitWidth = true
            self.view.addSubview(nameL)
            //有文字描述的
            let bhMarkSV = BHMarkStarView.init(frame: CGRect.init(x: 100, y: 260+50*CGFloat(i), width: self.view.frame.size.width-100, height: 50), numStar: 8, starTypeE: .NoTextType)
            bhMarkSV.backgroundColor = UIColor.cyan
            bhMarkSV.tag = i+10
            bhMarkSV.delegateStar = self
            self.view.addSubview(bhMarkSV)
        }
    }
    //实现协议方法
    func clickWhichStar(bhMarkView: BHMarkStarView, indexNum: Int) {
        switch bhMarkView.tag {
        case 1:
            print("输出的是第。。。一。。。个视图的第...\(indexNum+1)...个星星")
            break
        case 2:
            print("输出的是第。。。二。。。个视图的第...\(indexNum+1)...个星星")
            break
        case 3:
            print("输出的是第。。。三。。。个视图的第...\(indexNum+1)...个星星")
            break
        case 10:
            print("输出的是第。。。四。。。个视图的第...\(indexNum+1)...个星星")
            break
        case 11:
            print("输出的是第。。。五。。。个视图的第...\(indexNum+1)...个星星")
            break
        case 12:
            print("输出的是第。。。六。。。个视图的第...\(indexNum+1)...个星星")
            break
        default:
            break
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

