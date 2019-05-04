//
//  ViewController.swift
//  Swift-Guide
//
//  Created by max on 2019/5/4.
//  Copyright © 2019 陈子健. All rights reserved.
//

import UIKit

// 定义一个视图控制器
class ViewController: UIViewController {
    
    
    // MARK: - 基本介绍:这里只介绍一些初学swift的基本概念,需要提前了解的东西

    /*
     1.swift语法和OC不一样,OC每一行代码都是以分号";"结尾的,但是swift结尾是没有结尾标识符的
     2.OC只要语法正确就可以,不用整理格式,但是swift非常注重格式,比如 a = 3 ,在=的左右必须都有一个空格,或同时有多个,当=左右空格个数不一样时,比如 b= 2 这样会报错
     3.OC调用方式的时候是,是类名或对象名+空格+方法名,然后用中括号括起来:[Person saveCall];
     swift是类名或对象名+.+方法名即可: person.saveCall ,类似与OC的点语法
     4.swift语法整体兼容OC,可以通过桥接和OC无缝对接
     5.swift语法风格整体类似于Java
     6.新建的swift类,只有一个.swift文件,没有.h文件和.m文件
     7.swift可以使用cocoapods,方法同OC一样
     8.不需要导入头文件,可以直接引用其他类里面的方法或属性
     9.swift没有宏这个概念
     10.swift没有类扩展这个概念
     11.没有main.m文件  @UIApplicationMain是程序入口标识
     12.class 标示声明类  {} 用来标识类的范围
     13.构造函数 [xxx alloc] initWithXXX]  ==> xxx(XXX:) ;[alloc init] => ()
     14.UIButtonTypeContactAdd  => 枚举类型.枚举值(简写 .枚举值)
     15.在当前类中访问属性或者方法的时候 可以省略 self. 推荐不写, 后面的闭包中必须添加self.
     16.按钮的监听事件 使用 #selector
     
     */
    
    // 页面加载
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 函数声明和调用
        let area1 = getArea(a: 1, b: 2)
        let area2 = getArea2(width: 3, height: 4)
        print(area1,area2)
        demo2()
    }
    
    // MARK: - 函数介绍
    // 1.写法1
    func getArea(a: Int,b: Int) -> Int {
        return a * b
    }
    
    // 写法2:width 表示外部参数，a 和 b 标识函数的内部参数只能够在内部使用，可读性更强
    func getArea2(width a:Int,height b: Int) -> Int {
        return a * b
    }
    
    // MARK: - 常量和变量
    func demo1() {
        
        let a = 10
        // a = 2   ----> 会报错 let定义的变量不能改变,不能进行赋值
        print(a)   // ---> 打印使用print语法,不适用nslog
        
        var b = 20
        b = 30   //不会报错,var定义的变量是可以被修改的
        print(b)   // ---> 打印使用print语法,不适用nslog
        
        let c: Int = 10
        let d: CGFloat = 20.3
        /*
         swift是一个强类型的语言
         option + click 是swift开发的热键 没有之一
         Int 是swift中整数的默认类型(NSIbteger)
         小数默认类型是double
         let d: CGFloat = 20.3  这属于手动指定类型
         */
        
        
        // let res1 = c + d   -->  会报错
        let res2 = c + Int(d)  // 需把d强制转换成同一个类型
        print(res2)
        /*
         不同类型之间的运算
         swift中类型不一样的时候不能操作,没有银行形式的转换 需要coder手动转换数据
         转换类型: 通过类型调用构造函数 传递参数转换 ,或as语法
         */
    }
    
    // MARK: - swift与OC在视图创建和使用的不同
    func demo2() {
        
        // 创建一个视图
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myView.backgroundColor = UIColor.yellow // 第一种赋颜色方法
        myView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)   // 第二种赋颜色方法：color Literal属性
        
        // 创建一个btn
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)

        // let btn1 = UIButton(type: .contactAdd)  // 可以简写 直接.+枚举
        
        // 添加到父视图
        myView.addSubview(btn)
        
        //添加到根视图
        view.addSubview(myView)
        
        //给按钮添加点击事件
        btn.addTarget(self, action: #selector(btnDidClick), for: .touchUpInside)
        
    }
    
    // btn 点击事件
    @objc func btnDidClick() {
        print("我被点击了")
    }
    
    // MARK: - 可选类型
    func demo3() {
        
        //可选类型有可能有值,也有可能为nil
        //let声明可选类型是没有意义的
        //必选类型一定有值
        
        //这就是一个可选类型
        //不能够对可选类型做强制解包
        var a:Int? = 10
        a = nil

        
        var b: Int? = 15
        let c = (b ?? 0) + 20
        var d = 10
        let res = 20 + d
        
        print(res,(b ?? 0),c,d)
        
        //可选类型不能够直接计算
        /*
         你是否需要使用'?'或者'!'进行解包
         -- '!'强制解包 一定要获取一个值 不能够为nil
         -- '?'可选解包 后面具体说
         -- 如果可选类型要进行计算的时候,系统会报错,需要程序员手动处理可选类型
         -- '!'强制解包有风险,需要谨慎使用,程序员需要对'!'负责  如果为nil 程序会崩溃
         -- 一定要考虑是否安全 一定有值 防患于未然
         -- '??' 合并空选项 必须提高 ?? 的优先级
         */
    }


}

