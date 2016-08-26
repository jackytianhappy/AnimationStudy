//
//  ViewController.m
//  DynamicAnimation
//
//  Created by Jacky on 16/8/26.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIButton *snapButton;

//Dynamic animation
@property (strong,nonatomic) UIDynamicAnimator * animator;


@end

@implementation ViewController
-(UIDynamicAnimator *)animator{
    if (!_animator) {
        if (!_animator) {
            _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        }
    }
    return _animator;
}
-(void)reset{
    [self.animator removeAllBehaviors];
    self.imgView.center = CGPointMake(75, 114);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imgView.image = [UIImage imageNamed:@"屏幕快照 2016-08-26 下午3.38.36"];
    self.imgView.center = CGPointMake(75, 114);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gravityClick:(id)sender {
    [self reset];
    UIGravityBehavior *behavior = [[UIGravityBehavior alloc]init];
    behavior.angle = M_PI/2;
    behavior.gravityDirection = CGVectorMake(0, 1);
    behavior.magnitude = 0.5;
    [behavior addItem:self.imgView];
    [self.animator addBehavior:behavior];
}

- (IBAction)snapClick:(id)sender {
    [self reset];
    UISnapBehavior * snapbehavior = [[UISnapBehavior alloc] initWithItem:self.imgView snapToPoint:self.view.center];
    snapbehavior.damping = 0.65;
    [self.animator addBehavior:snapbehavior];
    
}

- (IBAction)colisionClick:(id)sender {
    [self reset];
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] init];
    [gravityBehavior addItem:self.imgView];
    UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] init];
    itemBehavior.resistance = 0.2;
    UICollisionBehavior * collisitionBehavior = [[UICollisionBehavior alloc] init];
    [collisitionBehavior addItem:self.imgView];
    collisitionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [collisitionBehavior addBoundaryWithIdentifier:@"Button" forPath:[UIBezierPath bezierPathWithRect:self.snapButton.frame]];
    [self.animator addBehavior:collisitionBehavior];
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:gravityBehavior];
}

- (IBAction)attachClick:(id)sender {
    [self reset];
    UIAttachmentBehavior * attachBeahavior =  [[UIAttachmentBehavior alloc] initWithItem:self.imgView attachedToAnchor:CGPointMake(CGRectGetMidX(self.view.frame), 100)];
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.imgView]];
    [self.animator addBehavior:attachBeahavior];
    [self.animator addBehavior:gravityBehavior];
}

- (IBAction)pushClick:(id)sender {
    [self reset];
    UIPushBehavior * push = [[UIPushBehavior alloc] initWithItems:@[self.imgView] mode:UIPushBehaviorModeInstantaneous];
    push.pushDirection = CGVectorMake(45, 0);
    push.magnitude = 1.0;
    UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.imgView]];
    itemBehavior.resistance = 0.8;
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:push];
}

@end
