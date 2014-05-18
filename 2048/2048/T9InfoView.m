//
//  T9InfoView.m
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#import "T9InfoView.h"

@implementation T9InfoView

- (void)initGameNameLabel{
    CGFloat fGNLabelWidthAndHeight = self.frame.size.width * 0.3;
    self.gameNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   fGNLabelWidthAndHeight,
                                                                   fGNLabelWidthAndHeight)];
    
    NSMutableParagraphStyle *pap = [[NSMutableParagraphStyle alloc] init];
    pap.alignment = NSTextAlignmentCenter;
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName: [UIColor orangeColor],
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:32],
                           NSParagraphStyleAttributeName: pap};
    
    NSAttributedString *attrs = [[NSAttributedString alloc]
                                 initWithString:@"2048"
                                 attributes:dict];
    
    [self.gameNameLabel setBackgroundColor:[UIColor grayColor]];
    [self.gameNameLabel setAttributedText:attrs];
}

- (void)initScoresLabel{
    CGSize frameSize = self.frame.size;
    self.scoreTitleLabel = [[UILabel alloc] initWithFrame:
                       CGRectMake(frameSize.width * 0.35, 0, frameSize.width * 0.3, frameSize.width * 0.3 * 0.5)];
    
    [self.scoreTitleLabel setBackgroundColor:[UIColor grayColor]];
    [self.scoreTitleLabel setTextColor:[UIColor greenColor]];
    [self.scoreTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.scoreTitleLabel setText:@"Score"];
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:
                       CGRectMake(frameSize.width * 0.35, frameSize.width * 0.3 * 0.5, frameSize.width * 0.3, frameSize.width * 0.3 * 0.5)];
    
    
    [self.scoreLabel setBackgroundColor:[UIColor grayColor]];
    [self.scoreLabel setTextColor:[UIColor greenColor]];
    [self.scoreLabel setTextAlignment:NSTextAlignmentCenter];
    [self.scoreLabel setText:[NSString stringWithFormat:@"%d", self.iScore]];
    self.scoreLabel.adjustsFontSizeToFitWidth = YES;
}

-(void)initHighestScoresLabel{
    CGSize frameSize = self.frame.size;
    
    self.highestScoreTitleLabel = [[UILabel alloc] initWithFrame:
                                   CGRectMake(frameSize.width * 0.7, 0, frameSize.width * 0.3, frameSize.width * 0.3 * 0.5)];
    
    [self.highestScoreTitleLabel setBackgroundColor:[UIColor grayColor]];
    [self.highestScoreTitleLabel setTextColor:[UIColor greenColor]];
    [self.highestScoreTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.highestScoreTitleLabel setText:@"Highest Score"];
    [self.highestScoreTitleLabel setTextAlignment:NSTextAlignmentCenter];
    self.highestScoreTitleLabel.adjustsFontSizeToFitWidth = YES;
    
    
    self.highestScoreLabel = [[UILabel alloc] initWithFrame:
                                   CGRectMake(frameSize.width * 0.7, frameSize.width * 0.3 * 0.5, frameSize.width * 0.3, frameSize.width * 0.3 * 0.5)];
    
    [self.highestScoreLabel setBackgroundColor:[UIColor grayColor]];
    [self.highestScoreLabel setTextColor:[UIColor greenColor]];
    [self.highestScoreLabel setText:[NSString stringWithFormat:@"%d", self.iHighestScore]];
    [self.highestScoreLabel setTextAlignment:NSTextAlignmentCenter];
    self.highestScoreLabel.adjustsFontSizeToFitWidth = YES;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initGameNameLabel];
        [self initScoresLabel];
        [self initHighestScoresLabel];
        
        [self addSubview:self.gameNameLabel];
        [self addSubview:self.scoreTitleLabel];
        [self addSubview:self.scoreLabel];
        [self addSubview:self.highestScoreTitleLabel];
        [self addSubview:self.highestScoreLabel];
    }
    return self;
}

@end
