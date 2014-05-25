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
@property (weak, nonatomic) IBOutlet T9MainDrawView *viewMain;
@property (weak, nonatomic) IBOutlet UIView *viewPlaceHolder;
@property (weak, nonatomic) IBOutlet T9InfoView *viewInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelBest;
@end
