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
@property (strong, nonatomic) IBOutlet T9MainDrawView *viewMain;
@property (strong, nonatomic) IBOutlet UIView *viewPlaceHolder;
@property (strong, nonatomic) IBOutlet T9InfoView *viewInfo;
@property (strong, nonatomic) IBOutlet UILabel *labelScore;
@property (strong, nonatomic) IBOutlet UILabel *labelBest;
@end
