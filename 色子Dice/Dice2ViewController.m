//
//  Dice2ViewController.m
//  CoreAnimationTest
//
//  Created by FOODING on 16/8/1934.
//  Copyright © 2016年 FOODING. All rights reserved.
//

#import "Dice2ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface Dice2ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation Dice2ViewController

- (CALayer *)faceWithTransform:(CATransform3D)transform {

    CALayer *layer = [CALayer layer];

    layer.frame = CGRectMake(-50, -50, 100, 100);

    layer.transform = transform;

    //    CGFloat red = rand()/(double)INT_MAX;
    CGFloat red = random() % 255 / 255.0;

    CGFloat green = random() % 255 / 255.0;

    CGFloat blue = random() % 255 / 255.0;

    layer.backgroundColor =
        [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

    return layer;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform {

    CATransformLayer *layer = [CATransformLayer layer];

    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);

    [layer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);

    [layer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [layer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [layer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [layer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 1, 0, 0);
    [layer addSublayer:[self faceWithTransform:ct]];

    CGSize containerSize = self.containerView.bounds.size;
    layer.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);

    layer.transform = transform;

    return layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.containerView.layer setBackgroundColor:[UIColor greenColor].CGColor];

    CATransform3D threeD = CATransform3DIdentity;

    threeD.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = threeD;

    CATransform3D first = CATransform3DIdentity;

    first = CATransform3DTranslate(first, -100, 0, 0);

    [self.containerView.layer addSublayer:[self cubeWithTransform:first]];

    CATransform3D second = CATransform3DIdentity;

    second = CATransform3DTranslate(second, 100, 0, 0);

    second = CATransform3DRotate(second, M_PI_4, 1, 0, 0);
    second = CATransform3DRotate(second, M_PI_4, 0, 1, 0);

    [self.containerView.layer addSublayer:[self cubeWithTransform:second]];
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
