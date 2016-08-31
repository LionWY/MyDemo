//
//  DiceViewController.m
//  CoreAnimationTest
//
//  Created by FOODING on 16/8/1834.
//  Copyright © 2016年 FOODING. All rights reserved.
//

#import "DiceViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DiceViewController ()

@end

@implementation DiceViewController

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    UIButton *btn = self.faceBtns[index];

    [self.containerView addSubview:btn];

    CGSize containerSize = self.containerView.bounds.size;
    btn.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);

    btn.layer.transform = transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    for (UIButton *btn in self.faceBtns) {
        btn.layer.doubleSided = NO;

        btn.layer.borderWidth = 0.5;
    }

    CATransform3D perspective = CATransform3DIdentity;

    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);

    self.containerView.layer.sublayerTransform = perspective;

    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);

    [self addFace:0 withTransform:transform];

    transform = CATransform3DMakeTranslation(100, 0, 0);

    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);

    [self addFace:1 withTransform:transform];

    transform = CATransform3DMakeTranslation(0, -100, 0);

    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);

    [self addFace:2 withTransform:transform];

    transform = CATransform3DMakeTranslation(0, 100, 0);

    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);

    [self addFace:3 withTransform:transform];

    transform = CATransform3DMakeTranslation(-100, 0, 0);

    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);

    [self addFace:4 withTransform:transform];

    transform = CATransform3DMakeTranslation(0, 0, -100);

    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);

    [self addFace:5 withTransform:transform];
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
