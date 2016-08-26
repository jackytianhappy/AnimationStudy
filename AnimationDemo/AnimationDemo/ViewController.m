//
//  ViewController.m
//  AnimationDemo
//
//  Created by Jacky on 16/8/25.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIImageView *containView;
@property (nonatomic,strong) UIImageView *firstImgView;
@property (nonatomic,strong) UIImageView *secondImgView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, 50, 50)];
    view.image        = [UIImage imageNamed:@"Bananavarieties"];
    [self.view addSubview:view];
    
    //向右东100的距离
    CABasicAnimation *animation   = [[CABasicAnimation alloc]init];
    animation.keyPath             = @"position.x";
    //animation.fromValue = @(view.layer.position.x);
    //animation.toValue = @(view.layer.position.x+100);
    animation.byValue             = @(100);
    animation.duration            = 3;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//加速式前进
        //    //这边能够提供加速的模式
        //    NSString *const kCAMediaTimingFunctionLinear;线性
        //    NSString *const kCAMediaTimingFunctionEaseIn;加速进入
        //    NSString *const kCAMediaTimingFunctionEaseOut;减速停止
        //    NSString *const kCAMediaTimingFunctionEaseInEaseOut;加速进入减速停止，这个是常用的
        //    NSString *const kCAMediaTimingFunctionDefault;默认
        //    当然，时间函数支持自定义，用如下函数
        //    functionWithControlPoints::::
        //    这个函数的4个点决定了一个三维的贝塞尔曲线来决定时间函数。这里不深入讲解了。
    animation.removedOnCompletion = NO;//与下面一行配合使用能够修改模型树
    animation.fillMode            = kCAFillModeForwards;
    [view.layer addAnimation:animation forKey:@"Jacky"];
    
    

    ///＊＊＊＊＊关键帧动画＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    UIImageView *view2 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 100, 50, 50)];
    view2.image = [UIImage imageNamed:@"Bananavarieties"];
    [self.view addSubview:view2];
    //简单的震动效果
    //    CAKeyframeAnimation *keyAnimation = [[CAKeyframeAnimation alloc]init];
    //    keyAnimation.keyPath = @"position.x";
    //    NSInteger initalPositionX = view2.layer.position.x;
    //    keyAnimation.values = @[@(initalPositionX),@(initalPositionX+10),@(initalPositionX-10),@(initalPositionX+10),@(initalPositionX-10)];
    //    keyAnimation.keyTimes = @[@(0),@(0.5),@(1),@(1.5),@(2)];
    //    [view2.layer addAnimation:keyAnimation forKey:@"JackyKeyAnimation"];
    //围绕某点进行画圆
    //    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    //    keyAnimation.keyPath = @"position";
    //    CGMutablePathRef mutablePath = CGPathCreateMutable();
    //    CGPathMoveToPoint(mutablePath, nil, view2.layer.position.x,view2.layer.position.y);
    //    CGPathAddLineToPoint(mutablePath, nil, self.view.center.x, self.view.center.y);
    //    CGPathAddArc(mutablePath, nil,  self.view.center.x, self.view.center.y, 100, 0, M_PI, YES);
    //    keyAnimation.path = mutablePath;
    //    keyAnimation.duration = 4.;
    //    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    //    keyAnimation.removedOnCompletion = NO;
    //    keyAnimation.fillMode = kCAFillModeForwards;
    //    [view2.layer addAnimation:keyAnimation forKey:@"JackyKey"];
    ///＊＊＊＊＊关键帧动画＊＊＊＊＊＊＊＊＊＊＊＊＊＊///关键帧的动画支持沿着路径运动，可以设置时间函数来决定运动的方式

    
   
    
    
    
    ///////////////////////layer的基本属性////////////////////////////////
//    UIView *layerView =[[UIView alloc]initWithFrame:CGRectMake(0, 250, 200 , 200)];
//    layerView.layer.backgroundColor = [UIColor lightGrayColor].CGColor;//背景色
//    layerView.layer.cornerRadius = 20.0;//圆角
//    layerView.layer.shadowColor = [UIColor blueColor].CGColor;//阴影颜色
//    layerView.layer.shadowOpacity = 0.8;//阴影透明度
//    layerView.layer.shadowOffset = CGSizeMake(3.0, 3.0);//阴影的偏移量
//    layerView.layer.borderColor = [UIColor redColor].CGColor;//边界颜色
//    layerView.layer.borderWidth = 2;//边界宽度
//    
//    CALayer * sublayer1 = [CALayer layer];
//    sublayer1.backgroundColor = [UIColor blueColor].CGColor;
//    sublayer1.frame = CGRectMake(0, 0,80,80);
//    sublayer1.anchorPoint = CGPointMake(0.5, 0.5);
//    sublayer1.position = CGPointMake(100,100);
//    [layerView.layer addSublayer:sublayer1];
//    [self.view addSubview:layerView];
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    ///＊＊＊＊＊动画组＊＊＊＊＊＊＊＊＊＊＊＊＊＊
   
    //demo 1放大旋转同时虚化
    //    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
    //        //变化透明度
    //        view3.alpha = 0.5;
    //        //旋转
    //        view3.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI), CGAffineTransformMakeScale(2.0, 2.0));
    //    } completion:^(BOOL finished) {
    //    }];
    
    //demo 2转场动画
        self.firstImgView.hidden = NO;
        self.secondImgView.hidden = YES;
        [UIView beginAnimations:@"AnimateInContainView" context:nil];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [UIView setAnimationDuration:1.0];
        self.firstImgView.hidden = YES;
        self.secondImgView.hidden = NO;
        [UIView commitAnimations];

    //demo 3连背景一起进行转向
//        [UIView transitionWithView:self.view duration:2. options:UIViewAnimationOptionTransitionCurlUp animations:^{
//            self.firstImgView.hidden = !self.firstImgView.hidden;
//            self.secondImgView.hidden = !self.secondImgView.hidden;
//        } completion:^(BOOL finished) {
//            
//        }];
    
    ///＊＊＊＊＊动画组＊＊＊＊＊＊＊＊＊＊＊＊＊＊
}

-(UIImageView *)containView{
    if (_containView == nil) {
        _containView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
        _containView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_containView];
        
    }
    return _containView;
}


-(UIImageView *)firstImgView{
    if (_firstImgView == nil) {
        _firstImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
        _firstImgView.image = [UIImage imageNamed:@"Bananavarieties"];
        [self.containView addSubview:_firstImgView];
    }
    return _firstImgView;
}

-(UIImageView *)secondImgView{
    if (_secondImgView == nil) {
        _secondImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
        _secondImgView.backgroundColor = [UIColor redColor];
        [self.containView addSubview:_secondImgView];
        
    }
    return _secondImgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
