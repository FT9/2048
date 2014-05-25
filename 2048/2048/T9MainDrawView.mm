//
//  T9MainDrawView.m
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#import "T9MainDrawView.h"
#import "T9ViewController.h"

@implementation T9MainDrawView


- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
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
    [self.delegate changeTheScore:m_pAlgCalc->getScore()];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    m_pAlgCalc->drawItems();
}

- (void)dealloc
{
    if (m_pAlgCalc)
        delete m_pAlgCalc;
}

@end
