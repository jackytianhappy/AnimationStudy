//
//  ViewController.m
//  AnimationDemo
//
//  Created by Jacky on 16/8/25.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.image        = [UIImage imageNamed:@"Bananavarieties"];
    [self.view addSubview:view];
    
    /////////////////基础动画/////////////////操作呈现树 为操作模型树
    //方式1 操作呈现树
//    CABasicAnimation *basic = [[CABasicAnimation alloc]init];
//    basic.keyPath = @"position.x";
//    basic.fromValue = @(self.view.layer.position.x);
//    basic.toValue = @(self.view.layer.position.x+100);
//    basic.duration = 1;
//    basic.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [view.layer addAnimation:basic forKey:@"test"];
    
    //方式2  操作呈现树 等同于以上方式
//    CABasicAnimation *basic = [[CABasicAnimation alloc]init];
//    basic.keyPath = @"position.x";
//    basic.byValue = @(100);
//    basic.duration = 1;
//    basic.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [view.layer addAnimation:basic forKey:@"test"];
    
    //方式3 操作完呈现树之后进行位置的设定 能够法比安原控件的位置
//    CABasicAnimation *basic = [[CABasicAnimation alloc]init];
//    basic.keyPath = @"position.x";
//    basic.byValue = @(100);
//    basic.duration = 1;
//    basic.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [view.layer addAnimation:basic forKey:@"test"];
//    view.layer.position = CGPointMake(view.layer.position.x+100, view.layer.position.y);
//    
    //方式4 操作完呈现树之后进行位置的设定 能够法比安原控件的位置 同方法3
//    CABasicAnimation *basic = [[CABasicAnimation alloc]init];
//    basic.keyPath = @"position.x";
//    basic.byValue = @(100);
//    basic.duration = 1;
//    basic.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    basic.removedOnCompletion = NO;//结束后删除动画属性
//    basic.fillMode = kCAFillModeForwards;//结束后动画进行停留
//    [view.layer addAnimation:basic forKey:@"test"];
    /////////////////基础动画/////////////////
    
    
    ///＊＊＊＊＊关键帧动画＊＊＊＊＊＊＊＊＊＊＊＊＊＊///关键帧的动画支持沿着路径运动，可以设置时间函数来决定运动的方式
    //demo 1 一秒内的抖动 对应位置对应对应时间
//    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position.x";
//    NSInteger initalPositionX = view.layer.position.x;
//    animation.values = @[@(initalPositionX),
//                         @(initalPositionX + 10),
//                         @(initalPositionX - 10),
//                         @(initalPositionX + 10),
//                         @(initalPositionX)];
//    animation.keyTimes = @[
//                           @(0),
//                           @(1/6.0),
//                           @(3/6.0),
//                           @(5/6.0),
//                           @(1)];
//    [view.layer addAnimation:animation forKey:@"keyFrame"];
    
    //demo 2 创建一个比较复杂的运动,首先移动到（200，200），然后沿着以该点为圆心，逆时针旋转半圈，最后停在结束的位置
//    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    //Create Path
//    CGMutablePathRef mutablepath = CGPathCreateMutable();
//    CGPathMoveToPoint(mutablepath, nil,view.layer.position.x, view.layer.position.y);
//    CGPathAddLineToPoint(mutablepath,nil,200,200);
//    CGPathAddArc(mutablepath, nil,200,200,100,0,M_PI,YES);
//    //set path
//    animation.path = mutablepath;
//    animation.duration = 4.0;
//    animation.rotationMode = kCAAnimationRotateAuto;
//    animation.removedOnCompletion = NO;//动画结束了禁止删除
//    animation.fillMode = kCAFillModeForwards;//停在动画结束处
//    [view.layer addAnimation:animation forKey:@"PathAnimation"];
    ///＊＊＊＊＊关键帧动画＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    
    
    
    ///＊＊＊＊＊动画组＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    //方法1
//    CAKeyframeAnimation * pathAnimation = [CAKeyframeAnimation animation];
//    pathAnimation.keyPath = @"position";
//    //Create Path
//    CGMutablePathRef mutablepath = CGPathCreateMutable();
//    CGPathMoveToPoint(mutablepath, nil,view.layer.position.x, view.layer.position.y);
//    CGPathAddLineToPoint(mutablepath,nil,200,200);
//    CGPathAddArc(mutablepath, nil,200,200,100,0,M_PI,YES);
//    //set path
//    pathAnimation.path = mutablepath;
//    pathAnimation.rotationMode = kCAAnimationRotateAuto;
//    [view.layer addAnimation:pathAnimation forKey:@"PathAnimation"];
//    
//    //透明度变化
//    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animation];
//    opacityAnimation.keyPath = @"opacity";
//    opacityAnimation.values = @[@(1.0),
//                                @(0.5),
//                                @(0.0),
//                                @(0.5),
//                                @(1.0)];
//    opacityAnimation.calculationMode = kCAAnimationPaced;
//    [view.layer addAnimation:opacityAnimation forKey:@"OpacityAnination"];
//    //配置动画组
//    CAAnimationGroup * animationGroup = [[CAAnimationGroup alloc] init];
//    animationGroup.animations = @[pathAnimation,opacityAnimation];
//    animationGroup.duration = 4.0;
//    animationGroup.removedOnCompletion = NO;
//    animationGroup.fillMode = kCAFillModeBackwards;
//    [view.layer addAnimation:animationGroup forKey:@"GroupAnimation"];
    
    //方法2
//    CGPoint oldCenter = view.center;
//    CGAffineTransform oldtransform = view.transform;
//    CGFloat oldAlpha = view.alpha;
//    
//    [UIView animateWithDuration:2.0 //动画持续时间
//                          delay:0.0 //延迟多久执行
//     
//                        options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState //执行选项：例如动画的过程描述，动画过程是否允许交互等等，比较多，更多参见文档
//                     animations:^{
//                         //执行的动画的block
//                         view.center = view.center;
//                         view.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI), CGAffineTransformMakeScale(2.0, 2.0));
//                         view.alpha = 0.5;
//                     }
//                     completion:^(BOOL finished) {
//                         //动画结束后的block
//                         view.center = oldCenter;
//                         view.transform = oldtransform;
//                         view.alpha = oldAlpha;
//                     }];
//    
    
    ///＊＊＊＊＊动画组＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    
    
    ///＊＊＊＊＊Dynamic Animation＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    

    ///＊＊＊＊＊Dynamic Animation＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    
    
    
    ///////////////////////layer的基本属性////////////////////////////////
    UIView *layerView =[[UIView alloc]initWithFrame:CGRectMake(0, 250, 200 , 200)];
    layerView.layer.backgroundColor = [UIColor lightGrayColor].CGColor;//背景色
    layerView.layer.cornerRadius = 20.0;//圆角
    layerView.layer.shadowColor = [UIColor blueColor].CGColor;//阴影颜色
    layerView.layer.shadowOpacity = 0.8;//阴影透明度
    layerView.layer.shadowOffset = CGSizeMake(3.0, 3.0);//阴影的偏移量
    layerView.layer.borderColor = [UIColor redColor].CGColor;//边界颜色
    layerView.layer.borderWidth = 2;//边界宽度
    
    CALayer * sublayer1 = [CALayer layer];
    sublayer1.backgroundColor = [UIColor blueColor].CGColor;
    sublayer1.frame = CGRectMake(0, 0,80,80);
    sublayer1.anchorPoint = CGPointMake(0.5, 0.5);
    sublayer1.position = CGPointMake(100,100);
    [layerView.layer addSublayer:sublayer1];
    
    [self.view addSubview:layerView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
