//
//  T9ViewController.h
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "T9MainDrawView.h"
@class T9InfoView;

@interface T9ViewController : UIViewController<T9MainDrawViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blankVConstraints;
@property (strong, nonatomic) IBOutlet T9InfoView *InfoView;
@property (strong, nonatomic) IBOutlet UIView *PlaceHolderView;
@property (strong, nonatomic) IBOutlet T9MainDrawView *MainView;
@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (weak, nonatomic) IBOutlet UILabel *Best;
@end
