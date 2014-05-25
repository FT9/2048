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
    //  UIColor *backgrounColor = [[UIColor alloc] initWithRed:0.258 green:0.248 blue:0.241 alpha:1];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
   
    for (UIView *view in self.view.subviews)
    {
        if (view.tag != 1)
            [view setBackgroundColor:[UIColor lightGrayColor]];
    }
    [self.MainView setBackgroundColor:[UIColor darkGrayColor]];
    
    UISwipeGestureRecognizer *swipeGestureright = [[UISwipeGestureRecognizer alloc] initWithTarget:self.MainView action:@selector(handleSwipeGesture:)];
    [swipeGestureright setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self.MainView action:@selector(handleSwipeGesture:)];
    [swipeGestureLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *swipeGestureUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self.MainView action:@selector(handleSwipeGesture:)];
    [swipeGestureUp setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer *swipeGestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self.MainView action:@selector(handleSwipeGesture:)];
    [swipeGestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [self.MainView addGestureRecognizer:swipeGestureright];
    [self.MainView addGestureRecognizer:swipeGestureLeft];
    [self.MainView addGestureRecognizer:swipeGestureUp];
    [self.MainView addGestureRecognizer:swipeGestureDown];
    [self.MainView setUserInteractionEnabled:YES];
    
    self.MainView.translatesAutoresizingMaskIntoConstraints = NO;
    self.InfoView.translatesAutoresizingMaskIntoConstraints = NO;
    self.MainView.delegate = self;
    
    [self.Score setText:@"0"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTheScore:(int)score
{
    [self.Score setText:[NSString stringWithFormat:@"%d", score]];
}

@end
