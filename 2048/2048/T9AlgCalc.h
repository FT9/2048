//
//  T9DigitalItem.h
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#ifndef _048_T9AlgCalc_h
#define _048_T9AlgCalc_h
#include <vector>

class T9DigitalItem;

class T9AlgCalc
{
public:
    T9AlgCalc(float unit);

public:
    void init();
    void drawItems();
    
    bool moveLeft();
    bool moveRight();
    bool moveUp();
    bool moveDown();
    int getScore();
    
private:
    bool _CheckCanMoveLeft();
    bool _CheckCanMoveRight();
    bool _CheckCanMoveUp();
    bool _CheckCanMoveDown();
    bool _CheckHorizontalSolve();
    bool _CheckVerticalSolve();
    
    void _AddItem(int idx);
    void _RemoveItem(int idx);
    void _GenNewItem();
    void _ProcessRow(std::vector<int> &vecIdx, std::vector<T9DigitalItem*> &);
    
    int _FindLocatePos(int iChangeDime, int iConstDime, bool bOnXaxis);
    bool _CheckHasSolve();
    
private:
    float m_unit;
    std::vector<int> m_DrawPosition;
    std::vector<int> m_EmptyPosition;
    T9DigitalItem *m_container[16];
    int m_score;
};

#endif
