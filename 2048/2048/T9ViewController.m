//
//  T9ViewController.m
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "T9ViewController.h"
#import "T9MainDrawView.h"
#import "T9InfoView.h"

@interface T9ViewController ()

@end

@implementation T9ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    const CGFloat bottomMarginFactor = 0.04, topMarginFactor = 0.04, horizontalMarginFactor = 0.03;
    CGFloat fMDViewWidthAndHeight = self.view.frame.size.width * (1 - horizontalMarginFactor * 2);
    CGFloat fLeftMargin = self.view.frame.size.width * horizontalMarginFactor;
    CGFloat fTopMargin = self.view.frame.size.height * topMarginFactor;
    //CGFloat fRightMargin = self.view.frame.size.width * horizontalMarginFactor;
    CGFloat fBottomMargin = self.view.frame.size.height * bottomMarginFactor;
    
    CGFloat fInfoViewWidth = fMDViewWidthAndHeight;
    CGFloat fInfoViewHeight = self.view.frame.size.height - fTopMargin - fBottomMargin - fMDViewWidthAndHeight;
    CGPoint pointInfoViewStartPoint = CGPointMake(fLeftMargin, fTopMargin);
    T9InfoView *infoView = [[T9InfoView alloc]
                            initWithFrame:CGRectMake(pointInfoViewStartPoint.x,
                                                     pointInfoViewStartPoint.y,
                                                     fInfoViewWidth,
                                                     fInfoViewHeight)];
    
    CGPoint pointMDViewStartPoint = CGPointMake(fLeftMargin,self.view.frame.size.height - fMDViewWidthAndHeight - fBottomMargin);
    T9MainDrawView *mainDrawView = [[T9MainDrawView alloc]
                                    initWithFrame:CGRectMake(
                                                             pointMDViewStartPoint.x,
                                                             pointMDViewStartPoint.y,
                                                             fMDViewWidthAndHeight,
                                                             fMDViewWidthAndHeight)];
    
    
    UISwipeGestureRecognizer *swipeGestureright = [[UISwipeGestureRecognizer alloc] initWithTarget:mainDrawView action:@selector(handleSwipeGesture:)];
    [swipeGestureright setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:mainDrawView action:@selector(handleSwipeGesture:)];
    [swipeGestureLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *swipeGestureUp = [[UISwipeGestureRecognizer alloc] initWithTarget:mainDrawView action:@selector(handleSwipeGesture:)];
    [swipeGestureUp setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer *swipeGestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:mainDrawView action:@selector(handleSwipeGesture:)];
    [swipeGestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [mainDrawView addGestureRecognizer:swipeGestureright];
    [mainDrawView addGestureRecognizer:swipeGestureLeft];
    [mainDrawView addGestureRecognizer:swipeGestureUp];
    [mainDrawView addGestureRecognizer:swipeGestureDown];
    [mainDrawView setUserInteractionEnabled:YES];
    
    [self.view addSubview:infoView];
    [self.view addSubview: mainDrawView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
