//
//  T9DigitalItem.cpp
//  2048
//
//  Created by 马白 on 14-5-17.
//  Copyright (c) 2014年 马白. All rights reserved.
//

#include "T9AlgCalc.h"
#include "T9DigitalItem.h"

T9AlgCalc::T9AlgCalc(float unit)
    : m_unit(unit)
    , m_score(0)
{
    ;
}


void T9AlgCalc::init()
{
    for (int i = 0; i < 16; ++i)
    {
        m_container[i] = new T9DigitalItem(false);
    }
    
    
    int item1Idx = arc4random() % 8;
    int item2Idx = arc4random() % 8 + 8;
    
    for (int i = 0; i < 16; ++i)
    {
        if (i == item1Idx ||
            i == item2Idx)
            continue;
        
        m_EmptyPosition.push_back(i);
    }
    
    m_container[item1Idx]->setNum(2);
    m_DrawPosition.push_back(item1Idx);
    
    m_container[item2Idx]->setNum(2);
    m_DrawPosition.push_back(item2Idx);
    
    m_container[item1Idx]->setExist(true);
    m_container[item2Idx]->setExist(true);
}

int T9AlgCalc::getScore()
{
    return m_score;
}

void T9AlgCalc::drawItems()
{
    for (int i = 0; i < 16; ++i)
    {
        int x = i % 4;
        int y = i / 4;
        
        m_container[i]->drawItem(x, y, m_unit);
    }
}

void T9AlgCalc::_AddItem(int idx)
{
    assert(idx >= 0 &&
           idx < 16);
    
    std::vector<int>::iterator iter = std::find(m_DrawPosition.begin(), m_DrawPosition.end(), idx);
    assert(iter == m_DrawPosition.end());
    m_DrawPosition.push_back(idx);
    
    iter = std::find(m_EmptyPosition.begin(), m_EmptyPosition.end(), idx);
    assert(iter != m_EmptyPosition.end());
    m_EmptyPosition.erase(iter);
}

void T9AlgCalc::_RemoveItem(int idx)
{
    assert(idx >= 0 &&
           idx < 16);
    
    std::vector<int>::iterator iter = std::find(m_DrawPosition.begin(), m_DrawPosition.end(), idx);
    assert(iter != m_DrawPosition.end());
    m_DrawPosition.erase(iter);
    
    iter = std::find(m_EmptyPosition.begin(), m_EmptyPosition.end(), idx);
    assert(iter == m_EmptyPosition.end());
    m_EmptyPosition.push_back(idx);
}

void T9AlgCalc::_GenNewItem()
{
    int iEmptySize = m_EmptyPosition.size();
    int index = m_EmptyPosition[arc4random() % iEmptySize];
    
    m_DrawPosition.push_back(index);
    std::vector<int>::iterator iter =  std::find(m_EmptyPosition.begin(), m_EmptyPosition.end(), index);
    assert(iter != m_EmptyPosition.end());
    m_EmptyPosition.erase(iter);
    
    
    m_container[index]->setExist(true);
    m_container[index]->setNum(2);
    if (arc4random() % 2 && arc4random() % 2)
        m_container[index]->doubleNum();
    
}

bool T9AlgCalc::_CheckHasSolve()
{
    if (m_EmptyPosition.size())
        return true;
    
    if(_CheckVerticalSolve() ||
       _CheckHorizontalSolve())
        return true;
    
    return true;
}


void T9AlgCalc::_ProcessRow(std::vector<int> &vecIdx, std::vector<T9DigitalItem *> &vec)
{
    assert(vec.size() == 4);
    for (int i = 0; i < vec.size(); ++i)
    {
        if (!vec[i]->isExist())
            continue;
        
        for (int k = i + 1; k < vec.size(); ++k)
        {
            if (!vec[k]->isExist())
                continue;
            
            if (vec[i]->getNum() != vec[k]->getNum())
                break;
            
            m_score += vec[i]->doubleNum();
            vec[k]->setExist(false);
            _RemoveItem(vecIdx[k]);
            
            //强制外层结束
            i = k + 1;
            break;
        }
    }
    
    for (int i = 0; i < vec.size(); ++i)
    {
        if (vec[i]->isExist())
            continue;
        
        int iNextExistPos = -1;
        for (int k = i + 1; k < vec.size(); ++k)
        {
            if (vec[k]->isExist())
            {
                iNextExistPos = k;
                break;
            }
        }
        
        if (iNextExistPos == -1)
            return;
        
        std::swap(vec[i], vec[iNextExistPos]);
        _RemoveItem(vecIdx[iNextExistPos]);
        _AddItem(vecIdx[i]);
    }
}

bool T9AlgCalc::_CheckHorizontalSolve()
{
    for (int i = 0; i < 15; ++i)
    {
        if (i % 4 == 3)
            continue;
        
        if ((m_container[i]->isExist() && m_container[i + 1]->isExist()) &&
            (m_container[i]->getNum() == m_container[i + 1]->getNum()))
            return true;
    }
    return false;
}

bool T9AlgCalc::_CheckVerticalSolve()
{
    for (int i = 0; i < 12; ++i)
    {
        if ((m_container[i]->isExist() && m_container[i + 4]->isExist()) &&
            m_container[i]->getNum() == m_container[i + 4]->getNum())
            return true;
    }
    return false;
}

bool T9AlgCalc::_CheckCanMoveLeft()
{
    for (int i = 0; i < 16; ++ i)
    {
        if (i % 4 == 0)
            continue;
        
        if (m_container[i]->isExist() &&
            !m_container[i - 1]->isExist())
            return true;
    }
    
    return _CheckHorizontalSolve();
}

bool T9AlgCalc::_CheckCanMoveRight()
{
    for (int i = 0; i < 16; ++i)
    {
        if (i % 4 == 3)
            continue;
        
        if (m_container[i]->isExist() &&
            !m_container[i + 1]->isExist())
            return true;
    }
    return _CheckHorizontalSolve();
}

bool T9AlgCalc::_CheckCanMoveDown()
{
    for (int i = 0; i < 12; ++i)
    {
        if (m_container[i]->isExist() &&
            !m_container[i + 4]->isExist())
            return true;
    }
    
    return _CheckVerticalSolve();
}

bool T9AlgCalc::_CheckCanMoveUp()
{
    for (int i = 4; i < 16; ++i)
    {
        if (m_container[i]->isExist() &&
            !m_container[i -4]->isExist())
            return true;
    }
    return _CheckVerticalSolve();
}

bool T9AlgCalc::moveLeft()
{
    //没有移动也当作一个完成状态返回
    if (!_CheckCanMoveLeft())
        return true;
    
    for (int i = 0; i < 4; ++i)
    {
        std::vector<T9DigitalItem *> vec;
        std::vector<int> vecIdx;
        for (int j = 0; j < 4; ++j)
        {
            vec.push_back(m_container[j + 4 * i]);
            vecIdx.push_back(j + 4 * i);
        }
        _ProcessRow(vecIdx, vec);
        
        for (int j = 0; j < 4; ++j)
        {
            m_container[j + 4 * i] = vec[j];
        }
    }
    
    _GenNewItem();
    
    return _CheckHasSolve();
}

bool T9AlgCalc::moveUp()
{
    if (!_CheckCanMoveUp())
        return true;
    
    for (int i = 0; i < 4; ++i)
    {
        std::vector<T9DigitalItem *> vec;
        std::vector<int> vecIdx;
        
        for (int j = 0; j < 4; ++j)
        {
            vec.push_back(m_container[i + 4 * j]);
            vecIdx.push_back(i + 4 * j);
        }
        _ProcessRow(vecIdx, vec);
        
        for (int j = 0; j < 4; ++j)
        {
            m_container[i + 4 * j] = vec[j];
        }
    }
    
    _GenNewItem();
    return _CheckHasSolve();
}

bool T9AlgCalc::moveDown()
{
    if (!_CheckCanMoveDown())
        return true;
    
    for (int i = 0; i < 4; ++i)
    {
        std::vector<T9DigitalItem *> vec;
        std::vector<int> vecIdx;
        
        for (int j = 3; j >= 0; --j)
        {
            vec.push_back(m_container[j * 4 + i]);
            vecIdx.push_back(j * 4 + i);
        }
        
        _ProcessRow(vecIdx, vec);
        
        std::reverse(vec.begin(), vec.end());
        for (int j = 0; j < 4; ++j)
        {
            m_container[j * 4 + i] = vec[j];
        }
    }
    
    _GenNewItem();
    return _CheckHasSolve();
}

bool T9AlgCalc::moveRight()
{
    if (!_CheckCanMoveRight())
        return true;
    
    for (int i = 0; i < 4; ++i)
    {
        std::vector<T9DigitalItem *> vec;
        std::vector<int> vecIdx;
        
        for (int j = 3; j >= 0; --j)
        {
            vec.push_back(m_container[i * 4 + j]);
            vecIdx.push_back(i * 4 + j);
        }
        
        _ProcessRow(vecIdx, vec);
        
        std::reverse(vec.begin(), vec.end());
        for (int j = 0; j < 4; ++j)
        {
            m_container[i * 4 + j] = vec[j];
        }
    }
    
    _GenNewItem();
    return true;
}

































