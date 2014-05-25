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
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    for (UIView *view in self.view.subviews)
    {
        if (view.tag != 1)
            [view setBackgroundColor:[UIColor lightGrayColor]];
    }
    [self.viewMain setBackgroundColor:[UIColor darkGrayColor]];
    [self.labelScore setText:@"0"];
    self.viewMain.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewInfo.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewMain.delegate = self;
    
    UISwipeGestureRecognizer *swipeGestureright = [[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self.viewMain                                                                                           action:@selector(handleSwipeGesture:)];
    
    [swipeGestureright setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self.viewMain
                                                  action:@selector(handleSwipeGesture:)];
    
    [swipeGestureLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *swipeGestureUp = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget:self.viewMain
                                                action:@selector(handleSwipeGesture:)];
    
    [swipeGestureUp setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer *swipeGestureDown = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self.viewMain
                                                  action:@selector(handleSwipeGesture:)];
    
    [swipeGestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [self.viewMain addGestureRecognizer:swipeGestureright];
    [self.viewMain addGestureRecognizer:swipeGestureLeft];
    [self.viewMain addGestureRecognizer:swipeGestureUp];
    [self.viewMain addGestureRecognizer:swipeGestureDown];
    [self.viewMain setUserInteractionEnabled:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTheScore:(int)score
{
    [self.labelScore setText:[NSString stringWithFormat:@"%d", score]];
}

@end
