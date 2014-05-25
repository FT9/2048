//
//  T9MainDrawView.h
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "T9AlgCalc.h"

@protocol T9MainDrawViewDelegate
- (void) changeTheScore:(int)score;
@end

@interface T9MainDrawView : UIView
{
    T9AlgCalc *m_pAlgCalc;
}
@property( assign, nonatomic ) id< T9MainDrawViewDelegate > delegate;
-(void) handleSwipeGesture:(UISwipeGestureRecognizer*) recognier;
@end
