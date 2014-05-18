//
//  T9MainDrawView.m
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#import "T9MainDrawView.h"

@implementation T9MainDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor grayColor]];
        
        m_pAlgCalc = new T9AlgCalc((float)self.frame.size.width / 4);
        m_pAlgCalc->init();
    }
    return self;
}

- (void) handleSwipeGesture:(UISwipeGestureRecognizer *)recognier
{
    switch (recognier.direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
            m_pAlgCalc->moveLeft();
            break;
        case UISwipeGestureRecognizerDirectionDown:
            m_pAlgCalc->moveDown();
            break;
        case UISwipeGestureRecognizerDirectionRight:
            m_pAlgCalc->moveRight();
            break;
        case UISwipeGestureRecognizerDirectionUp:
            m_pAlgCalc->moveUp();
            break;
            
        default:
            break;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    m_pAlgCalc->drawItems();
}

@end
