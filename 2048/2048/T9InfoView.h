//
//  T9InfoView.h
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T9InfoView : UIView
@property(nonatomic, strong) UILabel *gameNameLabel;
@property(nonatomic, strong) UILabel *scoreTitleLabel;
@property(nonatomic, strong) UILabel *scoreLabel;
@property(nonatomic, strong) UILabel *highestScoreTitleLabel;
@property(nonatomic, strong) UILabel *highestScoreLabel;
@property(nonatomic, assign) int iScore;
@property(nonatomic, assign) int iHighestScore;
@end
