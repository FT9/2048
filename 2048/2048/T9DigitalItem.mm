//
//  T9DigitalItem.cpp
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#include "T9DigitalItem.h"

T9DigitalItem::T9DigitalItem(bool bExist)
    : m_bIsExist(bExist)
{
    ;
}

bool T9DigitalItem::isExist()
{
    return  m_bIsExist;
}

void T9DigitalItem::setExist(bool bExist)
{
    m_bIsExist = bExist;
}

int T9DigitalItem::getNum()
{
    return m_iNum;
}

void T9DigitalItem::setNum(int num)
{
    m_iNum = num;
}

int T9DigitalItem::doubleNum()
{
    m_iNum *= 2;
    return  m_iNum;
}

void T9DigitalItem::drawItem(int xUnit, int yUnit, float unitSize)
{
    if (isExist())
        _DrawExistItem(xUnit, yUnit, unitSize);
    else
        _DrawEmptyItem(xUnit, yUnit, unitSize);
}

void T9DigitalItem::_DrawEmptyItem(int xUnit, int yUnit, float unitSize)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddRect(context, CGRectMake(xUnit * unitSize + 2, yUnit * unitSize + 2, unitSize - 4, unitSize - 4));
    CGContextDrawPath(context, kCGPathFill);
}


void T9DigitalItem::_DrawExistItem(int xUnit, int yUnit, float unitSize)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _DrawColor());
    CGContextAddRect(context, CGRectMake(xUnit * unitSize + 2, yUnit * unitSize + 2, unitSize - 4, unitSize - 4));
    CGContextDrawPath(context, kCGPathFill);
    
    NSString *drawContent = [NSString stringWithFormat:@"%d", m_iNum];
    CGFloat fontSize = 30;
    CGRect ContentRect;
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] init];
    do
    {
        [attrs removeObjectForKey:NSFontAttributeName];
        
        [attrs setValue:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
        [attrs setValue:[UIFont boldSystemFontOfSize:fontSize] forKey:NSFontAttributeName];
        
        NSStringDrawingContext *DrawContext = [[NSStringDrawingContext alloc] init];
        ContentRect = [drawContent boundingRectWithSize:CGSizeMake(unitSize - 4, unitSize - 4)
                                                options:NSStringDrawingTruncatesLastVisibleLine
                                             attributes:attrs
                                                context:DrawContext];
        
        fontSize = fontSize * 0.9;
    } while (ContentRect.size.width > unitSize);
    
    
    
    [drawContent drawInRect:CGRectMake(
                                       xUnit * unitSize + (unitSize - ContentRect.size.width) / 2,
                                       yUnit * unitSize + (unitSize - ContentRect.size.height) / 2,
                                       ContentRect.size.width,
                                       ContentRect.size.height)
             withAttributes:attrs];
}

CGColorRef T9DigitalItem::_DrawColor()
{
    double seed = 0.0;
    double exp = (int)log2(m_iNum);
    if (exp < 10)
    {
        seed = exp / 10;
    }
    else
    {
        int tmp = exp;
        while (tmp > 10) {
            tmp = tmp / 10;
        }
        seed = exp / 10 + 0.2 * tmp;
    }
    return [UIColor colorWithRed:seed green:1 - seed blue:fabs(1 - 2*seed) alpha:1].CGColor;
}