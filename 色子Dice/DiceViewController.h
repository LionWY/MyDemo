//
//  DiceViewController.h
//  CoreAnimationTest
//
//  Created by FOODING on 16/8/1834.
//  Copyright © 2016年 FOODING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *faceBtns;

@end
