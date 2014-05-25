//
//  T9DigitalItem.h
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#ifndef _048_T9DigitalItem_h
#define _048_T9DigitalItem_h

class T9DigitalItem
{
public:
    explicit T9DigitalItem(bool bExist);
    
public:
    bool isExist();
    void setExist(bool bExist);
    
    int getNum();
    void setNum(int num);
    int doubleNum();
    void drawItem(int xUnit, int yUnit, float unitSize);
    
private:
    void _DrawEmptyItem(int xUnit, int yUnit, float unitSize);
    void _DrawExistItem(int xUnit, int yUnit, float unitSize);
    
    CGColorRef _DrawColor();
    
private:
    bool m_bIsExist;
    int m_iNum;
};

#endif
