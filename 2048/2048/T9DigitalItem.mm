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

void T9DigitalItem::doubleNum()
{
    m_iNum *= 2;
}

void T9DigitalItem::drawItem(int xUnit, int yUnit, float unitSize)
{
    NSString *drawContent = [NSString stringWithFormat:@"%d", m_iNum];
    
    NSDictionary *attrs = @{NSForegroundColorAttributeName:[UIColor blueColor],
                           NSBackgroundColorAttributeName:[UIColor brownColor],
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:15]};
    
    [drawContent drawInRect:CGRectMake(
                                       xUnit * unitSize,
                                       yUnit * unitSize,
                                       unitSize,
                                       unitSize)
             withAttributes:attrs];
}