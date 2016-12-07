//
//  BHMarkStarView.swift
//  SwiftMarkStartDemo
//
//  Created by healthmanage on 16/12/5.
//  Copyright © 2016年 healthmanager. All rights reserved.
//

import Foundation
import UIKit

//定义枚举，设计类型
enum BHStarType {
    case TextType//有文字和星星
    case NoTextType//只有星星
}
//定义协议，知道点击的哪一个
protocol BHClickMarkStarDelegate:NSObjectProtocol{
    
    //定义一个可以记录显示的哪颗星星的方法
    func clickWhichStar(bhMarkView:BHMarkStarView,indexNum:Int)
    
}

class BHMarkStarView: UIView {
    
    //定义代理对象
    var delegateStar:BHClickMarkStarDelegate?;
    
    //记录当前有几个星星
    var allNum:Int?
    //记录当前的类型
    var currentType:BHStarType?
    
    //最小值为3，如果选择有文字样式，默认为5颗星
    init(frame:CGRect,numStar aNum:Int,starTypeE aType:BHStarType) {
        super.init(frame: frame)
        if aNum<0 {
            allNum = 0
        }else{
            allNum = aNum
        }
        currentType = aType;
        
        //首先获取视图的宽、高
        let viewWidthF:CGFloat = frame.size.width
        let viewHeightF:CGFloat = frame.size.height
        
        switch aType {
        case .TextType://有文字样式
            
            //计算每个星星的大小宽、高
            let itemWidthF:CGFloat = viewWidthF / 5.0
            let itemHeightF:CGFloat = viewHeightF / 2.0
            //将小的值赋值给星星
            let starWidth:CGFloat = 30.0;
            let textArr:NSArray = ["很差","凑合","一般","不错","完美"]
            
            //创建按钮和星星
            for i in 0...4 {
                let starImgV = UIImageView.init(frame: CGRect.init(x: (itemWidthF-starWidth)/2+itemWidthF*CGFloat(i), y: (itemHeightF-starWidth)/2, width: starWidth, height: starWidth))
                starImgV.tag = i+100
                starImgV.image = UIImage.init(named: "StarUnSelect")
                self.addSubview(starImgV)
                
                let butt = UIButton.init(frame: CGRect.init(x: itemWidthF*CGFloat(i), y: 0, width: itemWidthF, height: itemHeightF));
                butt.tag = i+200
                butt.addTarget(self, action: #selector(buttClick), for: UIControlEvents.touchUpInside)
                self.addSubview(butt)
                
                let textLabel = UILabel.init(frame: CGRect.init(x: itemWidthF*CGFloat(i), y: itemHeightF, width: itemWidthF, height: itemHeightF))
                textLabel.text = textArr[i] as? String
                textLabel.adjustsFontSizeToFitWidth = true
                textLabel.textColor = UIColor.lightGray
                textLabel.font = UIFont.systemFont(ofSize: 13)
                textLabel.textAlignment = NSTextAlignment.center;
                self.addSubview(textLabel)
            }
            
            break
        
        case .NoTextType:
            //无文字样式
            //计算每个星星的大小宽、高
            let itemWidthF:CGFloat = viewWidthF / CGFloat(aNum)
            let itemHeightF:CGFloat = viewHeightF
            //设置星星的大小
            var starWidth:CGFloat = 0.0
            if itemWidthF>30 {
                //如果大于，保持大小为30
                starWidth = 30
                //创建按钮和星星
                for i in 0...aNum-1 {
                    let starImgV = UIImageView.init(frame: CGRect.init(x: (itemWidthF-starWidth)/2+itemWidthF*CGFloat(i), y: (itemHeightF-starWidth)/2, width: starWidth, height: starWidth))
                    starImgV.tag = i+100
                    starImgV.image = UIImage.init(named: "StarUnSelect")
                    self.addSubview(starImgV)
                    
                    let butt = UIButton.init(frame: CGRect.init(x: itemWidthF*CGFloat(i), y: 0, width: itemWidthF, height: itemHeightF));
                    butt.tag = i+200
                    butt.addTarget(self, action: #selector(buttClick), for: UIControlEvents.touchUpInside)
                    self.addSubview(butt)
                    
                }
            }else{
                //如果小于，判断宽、高的大小，将小的值赋值给星星
                //三目运算
                //starWidth = itemWidthF<itemHeightF ? itemWidthF:itemHeightF
                
                if itemWidthF<=itemHeightF {
                    //如果宽小于高
                    starWidth = itemWidthF
                    //创建按钮和星星
                    for i in 0...aNum-1 {
                        let starImgV = UIImageView.init(frame: CGRect.init(x: starWidth*CGFloat(i), y: (itemHeightF-starWidth)/2, width: starWidth, height: starWidth))
                        starImgV.tag = i+100
                        starImgV.image = UIImage.init(named: "StarUnSelect")
                        self.addSubview(starImgV)
                        
                        let butt = UIButton.init(frame: CGRect.init(x: starWidth*CGFloat(i), y: 0, width: starWidth, height: itemHeightF));
                        butt.tag = i+200
                        butt.addTarget(self, action: #selector(buttClick), for: UIControlEvents.touchUpInside)
                        self.addSubview(butt)
                    }
                }else{
                    //如果宽大于高
                    starWidth = itemHeightF
                    //创建按钮和星星
                    for i in 0...aNum-1 {
                        let starImgV = UIImageView.init(frame: CGRect.init(x: (itemWidthF-starWidth)/2+itemWidthF*CGFloat(i), y: 0, width: starWidth, height: starWidth))
                        starImgV.tag = i+100
                        starImgV.image = UIImage.init(named: "StarUnSelect")
                        self.addSubview(starImgV)
                        
                        let butt = UIButton.init(frame: CGRect.init(x: itemWidthF*CGFloat(i), y: 0, width: itemWidthF, height: itemHeightF));
                        butt.tag = i+200
                        butt.addTarget(self, action: #selector(buttClick), for: UIControlEvents.touchUpInside)
                        self.addSubview(butt)
                    }
                }
            }
            
            break
        }
    }
    //按钮执行的方法
    func buttClick(btn:UIButton){
        
        if currentType==BHStarType.TextType {
            for i in 0...4 {
                let starImgV = self.viewWithTag(i+100) as! UIImageView;
                starImgV.image = UIImage.init(named: "StarUnSelect")
            }
            for i in 0...btn.tag-200 {
                let starImgV = self.viewWithTag(i+100) as! UIImageView;
                starImgV.image = UIImage.init(named: "StarSelect")
            }
        }else{
            for i in 0...allNum!-1 {
                let starImgV = self.viewWithTag(i+100) as! UIImageView;
                starImgV.image = UIImage.init(named: "StarUnSelect")
            }
            for i in 0...btn.tag-200 {
                let starImgV = self.viewWithTag(i+100) as! UIImageView;
                starImgV.image = UIImage.init(named: "StarSelect")
            }
        }
        
        //使用代理方法
        if delegateStar != nil {
            //调用协议方法
            delegateStar?.clickWhichStar(bhMarkView: self,indexNum: btn.tag-200);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

