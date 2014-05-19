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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, _DrawColor());
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddRect(context, CGRectMake(xUnit * unitSize, yUnit * unitSize, unitSize, unitSize));
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSString *drawContent = [NSString stringWithFormat:@"%d", m_iNum];
    
    NSDictionary *attrs = @{NSForegroundColorAttributeName:[UIColor blueColor],
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:30]};
    
    CGSize size = [drawContent sizeWithAttributes:attrs];
    
    assert(size.width < unitSize && size.height < unitSize);
    [drawContent drawInRect:CGRectMake(
                                       xUnit * unitSize + (unitSize - size.width) / 2,
                                       yUnit * unitSize + (unitSize - size.height) / 2,
                                       unitSize,
                                       unitSize)
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