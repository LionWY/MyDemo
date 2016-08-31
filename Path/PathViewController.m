//
//  PathViewController.m
//  CoreAnimationTest
//
//  Created by FOODING on 16/8/1834.
//  Copyright © 2016年 FOODING. All rights reserved.
//

#import "PathViewController.h"

@interface PathViewController ()

@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIBezierPath *path = [[UIBezierPath alloc] init];

    //移动到point
    [path moveToPoint:CGPointMake(175, 100)];

    //画一个圈
    [path addArcWithCenter:CGPointMake(150, 100)
                    radius:25
                startAngle:0
                  endAngle:2 * M_PI
                 clockwise:YES];

    [path moveToPoint:CGPointMake(150, 125)];
    //画一条线
    [path addLineToPoint:CGPointMake(150, 175)];

    [path addLineToPoint:CGPointMake(125, 225)];

    [path moveToPoint:CGPointMake(150, 175)];

    [path addLineToPoint:CGPointMake(175, 225)];

    [path moveToPoint:CGPointMake(100, 150)];

    [path addLineToPoint:CGPointMake(200, 150)];

    CAShapeLayer *layer = [CAShapeLayer layer];

    layer.path = path.CGPath;

    //画笔颜色
    layer.strokeColor = [UIColor redColor].CGColor;
    //填充颜色
    layer.fillColor = [UIColor lightGrayColor].CGColor;

    layer.lineWidth = 5;
    //线条之间的结合点的样子
    layer.lineJoin = kCALineJoinRound;
    //线条结尾的样子
    layer.lineCap = kCALineCapRound;

    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation
before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
