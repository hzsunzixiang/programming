#pragma once
#include "PokerGlobal.h"
#include "GameConfig.h"
#include <assert.h>


static int TOTAL_OF_CARDS = 7;
//////////////////////////////////////////////////////////////////////////////
// PokerHands 一手牌，在德州扑克中，通常7张为一手牌
//////////////////////////////////////////////////////////////////////////////
class CPokerHands
{
public:
	CPokerHands(void)
	{
		Initialize();
	};
private:
	// 原始7张牌
	//POKERCARD m_Cards[TOTAL_OF_CARDS];
	POKERCARD m_Cards[7];
	// 优选出的最大5张牌
	POKERCARD *m_pHands;
	// 同样牌值计数结构
	SAME_CARDS_COUNT m_SameCards[3];
	// 花色统计数组, 记录7张牌中, 4种花色各自数量
	UCHAR m_ColorCount[4];
	// 记录是否同花, 0 值不是同花, 其他表示同花的花色
	UCHAR m_nFlushColor;
	// 同样牌值计数器
	UCHAR m_nSameCount;
	// 对牌统计 7张牌有时会出现3个对子
	UCHAR m_nPairCount ;	
	// 三条统计 7张牌有时会出现2个三条
	UCHAR m_nThreeKindCount;
	// 最优的5张牌的类型
	UCHAR m_nTypeHands ;
public:
	///////////////////////////////////////////////////////////////////////////
	// 对外部调用公开的函数定义

	///////////////////////////////////////////////////////////////////////////
	// 获取牌型 The Poker Hand Type
	///////////////////////////////////////////////////////////////////////////
	int GetHandsType(void) {return m_nTypeHands;};
	///////////////////////////////////////////////////////////////////////////
	// 检测牌型并优选出最大的5张牌
	///////////////////////////////////////////////////////////////////////////
	void CheckHandsType(POKERCARD *pHand)
	{
		// 断言是否SetHands设置过牌数据
		if(m_Cards[0].p_card==0)
			return;
		//assert(m_Cards[0].p_card != 0);
		m_pHands = pHand;

		// 德州扑克算法步骤  先统计花色的目的是 同花色的 放前面
		CountFlush();		// 2. 统计牌中各花色的数量，检测是否有5张同花色的牌
		SortCards();		// 1. 将牌从大到小依次排列，共7张
		CountSameCards();	// 3. 统计牌中复数牌的数量，例如对子、三条或四条
							// 4. 依次从最大牌型到最小牌型进行检测, 并选出最优的5张
		if(CheckStraightFlush())return;	// 同花顺 Royal Flush & Straight Flush
		if(CheckFourCard())		return;	// 四条 Four of a kind
		if(CheckFullHouse())	return;	// 葫芦 Full House
		if(CheckFlush())		return;	// 同花 Flush
		if(CheckStraight())		return;	// 顺子 Straight
		if(CheckThreeCard())	return;	// 三条 Three of a kind
		if(CheckTwoPair())		return;	// 两对 Two Pair
		if(CheckPair())			return;	// 一对 Pair
		if(CheckHighCard())		return;	// 高牌 High Card
		assert(0);						// 最差应为 TYPE_PIE_CARD，否则Big Bug
	}	
int GetHandCardTypeWithCard(USHORT card1,USHORT card2)
	{
		int nRet=-1;
		USHORT sColor=0xFF00;
		USHORT sValue=0x00FF;
		USHORT sA=0x000E;//值为A
		USHORT sJ=0x000B;//值为J
		USHORT s2=0x0002;//值为2
		USHORT sF=0x0100;//颜色为方块
		USHORT sH=0x0400;//颜色为黑桃
		bool bIsFlush=false;
		bool bIsStraight=false;
		bool bIsPair=false;
		bool bIsCardValid=false;
		
		//先排序，先按值排序，再按花色排序，保证card1一定大于card2
		USHORT tmp=card1;
		if( (card1 & sValue) < (card2 & sValue)) //先按值排序
		{
			tmp=card1;
			card1=card2;
			card2=tmp;
		}
		if( (card1 & sValue) == (card2 & sValue) )//若值相等，则按花色排序
		{
	        bIsPair=true;//对子
	        if((card1 & sColor) < (card2 & sColor))
	        {
				tmp=card1;
	            card1=card2;
	            card2=tmp;
	        }
	        
		}
		//检测手牌的值是否有效
		if( ((card1 & sColor)<=sH) && ((card1 & sValue)<=sA))
			bIsCardValid=true;
		if( (bIsCardValid && (card2 & sColor)>=sF)  && ((card2 & sValue)>=s2) )
			bIsCardValid=true;
		if(!bIsCardValid)
	    {
			return nRet;
	    }
			
			
		//做手牌统计
		if(!bIsPair && (card1 & sColor) == (card2 & sColor))//手牌的同花
			bIsFlush=true;
		int nDiffer =(int)((card1 & sValue) - (card2 & sValue));
		if(!bIsPair && (nDiffer==1 || nDiffer==12))//手牌的顺子，注意，此处 A与2 算为一个顺子
			bIsStraight=true;

	    if(!bIsFlush && !bIsStraight && !bIsPair)
	    {
	        if( (card1 & sValue)== sA && ((card2 & sValue)>=sJ && (card2 & sValue)<sA) )
	            return HAND_CARD_TYPE_UNFLUSH_AQ_OR_AJ;
	        return HAND_CARD_TYPE_PIE;
	    }

	    if(bIsFlush)//同花
	    {
	        if((card1 & sValue)== sA)
	        {
	            if((card2 & sValue)==(sA-1))
	                return HAND_CARD_TYPE_FLUSH_AK;
	            if((card2 & sValue)>=sJ && (card2 & sValue)<sA)
	                return HAND_CARD_TYPE_FLUSH_AQ_OR_AJ;
	        }
	        if(bIsStraight)
	            return HAND_CARD_TYPE_FLUSH_STRAIGHT;
	        return HAND_CARD_TYPE_FLUSH;
	    }

	    if(bIsStraight)
	    {
	        if((card1 & sValue)== sA && (card2 & sValue)==(sA-1) )
	            return HAND_CARD_TYPE_UNFLUSH_AK; 
	        return HAND_CARD_TYPE_STRAIGHT;  
	    }
			
		if(bIsPair)//对子
		{
			if((card1 & sValue)>=s2 && (card1 & sValue)<sJ)
				return HAND_CARD_TYPE_PAIR_2_TO_10;//对2到对10
			if((card1 & sValue)>=sJ && (card1 & sValue)<sA)
				return HAND_CARD_TYPE_PAIR_J_TO_K;//对J到对K
			if((card1 & sValue)==sA)
				return HAND_CARD_TYPE_PAIR_A;//对A
		}
	    
	    return nRet;
	}	
	///////////////////////////////////////////////////////////////////////////
	// 初始化内部所有变量，重复利用对象时可调用
	///////////////////////////////////////////////////////////////////////////
	void Initialize(void)
	{
		m_nFlushColor = 0;		// 初始化同花标志
		m_nSameCount = 0;		// 复数牌数量
		m_nPairCount = 0;		// 对牌数量
		m_nThreeKindCount = 0;	// 三条数量
		m_nTypeHands = 0;		// 牌型，最小牌型应从1开始 TYPE_PIE_CARD
		m_pHands = NULL;

		// 初始化各种数组
		memset(m_Cards, 0, sizeof(m_Cards));
		memset(m_ColorCount, 0, sizeof(m_ColorCount));
		memset(m_SameCards, 0, sizeof(m_SameCards));
	}
	///////////////////////////////////////////////////////////////////////////
	// 设置牌值
	///////////////////////////////////////////////////////////////////////////
	void SetHands(USHORT c1, USHORT c2, USHORT *pBoardCard)
	{
		m_Cards[0].p_card = pBoardCard[0];
		m_Cards[1].p_card = pBoardCard[1];
		m_Cards[2].p_card = pBoardCard[2];
		m_Cards[3].p_card = pBoardCard[3];
		m_Cards[4].p_card = pBoardCard[4];
		if(c1 == 0 && c2 == 0)
		{
			TOTAL_OF_CARDS = 5;
		}
		else
		{
			TOTAL_OF_CARDS = 7;
			m_Cards[5].p_card = c1;		
			m_Cards[6].p_card = c2;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	void SetHands(UCHAR *hands)
	{
		for(int i = 0; i < TOTAL_OF_CARDS; i ++)
		{
			m_Cards[i].p_color = hands[i*2];
			m_Cards[i].p_value = hands[i*2+1];

			// 断言牌值范围 2 - 14
			assert(m_Cards[i].p_value >= 2 && m_Cards[i].p_value <= 14);
			// 断言牌面花色 1 - 4 黑红梅方
			assert(m_Cards[i].p_color >= 1 && m_Cards[i].p_color <= 4);
		}
	}
private:
	///////////////////////////////////////////////////////////////////////////
	// 内部辅助函数定义开始

	///////////////////////////////////////////////////////////////////////////
	// 将一组牌从大到小进行排序 Ace = 14
	///////////////////////////////////////////////////////////////////////////
	void SortCards(void)   // 只排列大小 不管花色
	{
		USHORT temp, max;
		for(int i = 0; i < TOTAL_OF_CARDS; i ++)
		{
			max = i;
			if(m_Cards[i].p_card == 0) //如果牌非法返回
				return;
			for(int j = i + 1; j < TOTAL_OF_CARDS; j ++)
			{	
				if(m_Cards[j].p_card == 0)
					continue;
				if((m_Cards[j].p_value > m_Cards[max].p_value))
					max = j;
				/////////// 有同花者放前
				if(m_nFlushColor != 0 && m_Cards[j].p_value == m_Cards[max].p_value
					&& m_Cards[j].p_color==m_nFlushColor)
					max = j;
				///////////
			}
			if(max != i)
			{
				temp = m_Cards[i].p_card;
				m_Cards[i].p_card = m_Cards[max].p_card;
				m_Cards[max].p_card = temp;
			}
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查一组牌中同样花色的牌是否大于5张
	///////////////////////////////////////////////////////////////////////////
	void CountFlush(void)
	{
		for(int i = 0; i < TOTAL_OF_CARDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			if(++m_ColorCount[m_Cards[i].p_color-1] >= TOTAL_OF_HANDS)
			{
				m_nFlushColor = m_Cards[i].p_color;
				break;// 牌面包含同花
			}
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 统计一组7张牌中, 对子，三条或四条的数量
	///////////////////////////////////////////////////////////////////////////
	void CountSameCards(void)  // 此时已经排好序
	{
		int i, nCount = 0;
		UCHAR start = 0;

		for(i = 1; i < TOTAL_OF_CARDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			if(nCount == 0)
			{
				nCount = 1;
				start = m_Cards[i-1].p_value;
			}
			if(start == m_Cards[i].p_value)
				nCount++;
			else
			{
				if(nCount >= 2)
					set_same_cards(i, nCount);
				nCount = 0;
			}
		}
		if(nCount >= 2)
			set_same_cards(i, nCount);
	}
	///////////////////////////////////////////////////////////////////////////
	// 记录对子、三条、四条所在的位置及数量， 方便CountSameCards调用
	///////////////////////////////////////////////////////////////////////////
	void set_same_cards(int nPos, int nCount)
	{
		m_SameCards[m_nSameCount].pos = nPos - nCount;	// 位置减数量，得出对子起始位置
		m_SameCards[m_nSameCount].count = nCount;
		assert(m_nSameCount < 3);	// 断言一组牌中不可能超过3组对子
		m_nSameCount ++;		// 总的对牌计数
		switch(nCount)
		{
		case 2:
			m_nPairCount ++;	// 对子计数
			break;
		case 3:
			m_nThreeKindCount ++;// 三条计数
			break;
		};
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查是否顺子		bFlush = true 检查时是否考虑花色问题
	// 返回 = -1 说明不是顺子
	// 返回 >= 4 顺子最右边的牌在CARDS中的位置, 但Ace例外,Ace是大牌, 排在最左边
	// 返回值 != -1:
	//		> 对于不是最小的[同花]顺子,则为已降序排序的原始7张牌中[注意Ace的值是14,最大]即m_Cards[TOTAL_OF_CARDS],
	//				刚好构成[同花]顺子的最后一张牌的下标index
	//		> 注意如果是最小的顺子则为: 100 + index
	// 返回值示例:
	//		> 同花顺(括号数值代表花色),m_Cards => [A(1), 5(1), 5(2), 4(1), 3(1), 2(1), 2(3)],则返回 (100 + 5)
	//		> 普通顺子(括号数值代表花色),m_Cards => [6(1), 5(3), 5(2), 4(1), 3(2), 2(1), 2(3)],则返回 (5)
	///////////////////////////////////////////////////////////////////////////
	int IsStraight(bool bFlush = true)
	{
		int i = 0, nCount = 0 ;
		UCHAR pos = 0;
		while(i ++ < TOTAL_OF_CARDS-1)
		{
			if(m_Cards[i-1].p_card == 0)
				return -1;
			if(nCount == 0)
			{
				if(bFlush && m_Cards[i-1].p_color != m_nFlushColor)
					continue; // 如果顺子起始牌的花色是同花, 则SKIP

				nCount = 1;
				pos = m_Cards[i-1].p_value;
			}
			if(bFlush && m_Cards[i].p_color != m_nFlushColor)	// 花色是否一样
				continue;
			
			// 如果顺子起始牌, 与后而的N张牌够成顺子,则COUNT++计数
			if(pos == m_Cards[i].p_value + nCount)
			{
				// 检测 A，2，3，4，5
				if(++nCount == 4 && pos == 5 && m_Cards[0].p_value == 14)
				{
					if(!bFlush || m_Cards[0].p_color == m_nFlushColor)
						return 100 + i;
				}
				// 够5张即是顺子
				if(nCount >= TOTAL_OF_HANDS) return i;
			}else
			{
				if(m_Cards[i].p_value != m_Cards[i-1].p_value)
					nCount = 0;
				//if(pos == 14 && m_Cards[i-1].p_value == 5 && m_Cards[i].p_value == 5)
				//	nCount = 0;
			}
		}
		return -1;
	}
private:
	///////////////////////////////////////////////////////////////////////////
	// 提取优选牌算法函数定义开始

	///////////////////////////////////////////////////////////////////////////
	// 提取同花顺子,或顺子  bFlush = true 同花选项
	// 从m_Cards 7 张牌中筛选出最大的5张顺子, 如果是A,2,3,4,5 则Ace放在最右边
	// 参数 bFlush = true 只筛选同花, bFlush = false 忽略花色
	///////////////////////////////////////////////////////////////////////////
	void FilterStraight(int nPos, bool bFlush = true)
	{
		int handpos = TOTAL_OF_HANDS - 1;	// handpos 从数组的最右端依次放入优牌

		// nPos > 100 的情况为最小顺子,例: A,2,3,4,5, 否则为普通顺子
		if(nPos > 100)
		{
			nPos -= 100;
			int nAcePos = 0;

			if(bFlush)	// 如果是同花,则需循环获取到同花色的那张Ace
			{
				for(int i = 0; i < 2; i ++)// 在SortCards因为有将同大小的牌中同花的牌放前面,且Ace值为14所以这里判断前面数据就可以
				{
					if(m_Cards[i].p_color == m_nFlushColor)
					{
						nAcePos = i;
						break;
					}
				}
			}
			// 获取A,2,3,4,5中的Ace牌, 此时Ace为小牌, 放入数组中的最右边
			m_pHands[handpos--].p_card = m_Cards[nAcePos].p_card;
		}
		// 开始循环, 从右向左提取顺子
		while(handpos >= 0)
		{
			if(bFlush)// bFlush = true 取同花顺子
			{
				if(m_Cards[nPos].p_color != m_nFlushColor)	// 花色不同 SKIP
				{
					nPos --; 
					continue;
				}
			}else	// bFlush = false 取普通顺子
			{
				if(handpos < TOTAL_OF_HANDS - 1 &&
					m_pHands[handpos+1].p_value == m_Cards[nPos].p_value)   // 这里不好理解
				{
						nPos --;
						continue;
				}
			}
			// 提取顺子
			m_pHands[handpos--].p_card = m_Cards[nPos--].p_card;
		}
		// 如果顺子的第一张为A, 则为皇家同花顺
		if(bFlush && m_pHands[0].p_value == 14)
			m_nTypeHands = TYPE_ROYAL_FLUSH;
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取四条 Four of a Kind
	///////////////////////////////////////////////////////////////////////////
	void FilterFourCard(int nPos)
	{
		// 获取4条的4张牌
		m_pHands[0].p_card = m_Cards[nPos].p_card ;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card ;
		m_pHands[2].p_card = m_Cards[nPos+2].p_card ;
		m_pHands[3].p_card = m_Cards[nPos+3].p_card ;

		// 获取四条牌型的第5张 Kickers 起脚牌
		nPos = nPos == 0 ? 4 : 0;
		m_pHands[4].p_card = m_Cards[nPos].p_card;
	}
	///////////////////////////////////////////////////////////////////////////
	// 辅助函数, 找出并取出第一组三条,从左至右放入优选数组
	///////////////////////////////////////////////////////////////////////////
	void FilterFirstThreeCard(void)
	{
		int nPos = -1;
		// 找出第一组三条所在的位置
		for(int i = 0; i < m_nSameCount; i ++)
		{
			if(m_SameCards[i].count == 3)
			{
				nPos = m_SameCards[i].pos;
				break;
			}
		}
		assert(nPos != -1);
		// 循环3次, 取出三条
		for(int i = 0; i < 3; i ++)
			m_pHands[i].p_card = m_Cards[nPos+i].p_card;
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取葫芦 Full House
	///////////////////////////////////////////////////////////////////////////
	void FilterFullHouse(void)
	{
		int nPos = 0;

		// 取Full House牌型中的第一组三条
		FilterFirstThreeCard();

		// m_nThreeKindCount > 1 说明是两个三条, 否则是三条加两对或一对
		if(m_nThreeKindCount > 1)
		{
			// 取得第二组三条的前两张
			nPos = m_SameCards[1].pos;
			m_pHands[3].p_card = m_Cards[nPos].p_card;
			m_pHands[4].p_card = m_Cards[nPos+1].p_card;
		}else
		{
			// 找出对子所在位置
			for(int i = 0; i < m_nSameCount; i ++)
			{
				if(m_SameCards[i].count == 2)
				{
					nPos = m_SameCards[i].pos;
					break;
				}
			}
			// 取出最大对子的两张牌
			m_pHands[3].p_card = m_Cards[nPos].p_card;
			m_pHands[4].p_card = m_Cards[nPos+1].p_card;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取同花 Flush, 从左至向，从大到小，选出5张同花
	///////////////////////////////////////////////////////////////////////////
	void FilterFlush(void)
	{
		int nPos = 0;
		for(int i = 0; i < TOTAL_OF_CARDS && nPos < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			if(m_Cards[i].p_color == m_nFlushColor)
				m_pHands[nPos++].p_card = m_Cards[i].p_card;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取三条 Three of a kind
	///////////////////////////////////////////////////////////////////////////
	void FilterThreeCard(void)
	{
		FilterFirstThreeCard();

		UCHAR ch = m_pHands[0].p_value;
		for(int i = 0, n = 3; i < TOTAL_OF_CARDS && n < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			if(ch != m_Cards[i].p_value)
				m_pHands[n++].p_card = m_Cards[i].p_card;	
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取两对 Two pair
	///////////////////////////////////////////////////////////////////////////
	void FilterTwoPair(void)
	{
		assert(m_SameCards[0].count == 2);
		assert(m_SameCards[1].count == 2);

		// 取出第一对
		int nPos = m_SameCards[0].pos;
		m_pHands[0].p_card = m_Cards[nPos].p_card;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card;
		
		// 取出第二对
		nPos = m_SameCards[1].pos;
		m_pHands[2].p_card = m_Cards[nPos].p_card;
		m_pHands[3].p_card = m_Cards[nPos+1].p_card;

		// 取出最大牌 Two Pair中的Kickers起脚牌
		for(int i = 0; i < TOTAL_OF_CARDS; i ++)
		{
			if(m_Cards[i].p_card != 0 && m_Cards[i].p_value != m_pHands[0].p_value	&& m_Cards[i].p_value != m_pHands[2].p_value)
			{
				m_pHands[4].p_card = m_Cards[i].p_card;
				break;
			}
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取对子 Pair
	///////////////////////////////////////////////////////////////////////////
	void FilterPair(void)
	{
		assert(m_SameCards[0].count == 2);
		// 取出第一对
		int nPos = m_SameCards[0].pos;
		m_pHands[0].p_card = m_Cards[nPos].p_card;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card;

		// 取出最大牌 Pair中三张的Kickers起脚牌
		for(int i = 0, n = 2; i < TOTAL_OF_CARDS && n < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card != 0 && m_Cards[i].p_value != m_pHands[0].p_value)
				m_pHands[n++].p_card = m_Cards[i].p_card;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// 提取高牌 High Card
	///////////////////////////////////////////////////////////////////////////
	void FilterHighCard(void)
	{
		// 从大到小 复制前5张牌
		for(int i = 0; i < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			m_pHands[i].p_card = m_Cards[i].p_card;
		}

		// 如果最大的牌大于J, 则为类型高牌 High Card, 否则为杂牌 Pie Card
		if(m_pHands[0].p_value < 11)
			m_nTypeHands = TYPE_PIE_CARD;
	}
private:
	///////////////////////////////////////////////////////////////////////////
	// 检测优选牌算法函数定义开始

	///////////////////////////////////////////////////////////////////////////
	// 检查是否同花顺 Royal Fulsh
	///////////////////////////////////////////////////////////////////////////
	bool CheckStraightFlush(void)
	{
		if(m_nFlushColor == 0)
			return false;

		int nPos = IsStraight(true);
		if(nPos != -1)
		{
			// 缺省为普通同花顺子
			m_nTypeHands = TYPE_STRAIGHT_FLUSH;
			FilterStraight(nPos, true);
			return true;
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检测是否四条 Four of a Kind
	///////////////////////////////////////////////////////////////////////////
	bool CheckFourCard(void)
	{
		// 循环检测是否包括4条, 防止类似 A,A,A,5,5,5,5 牌型
		for(int i = 0; i < m_nSameCount; i ++)
		{
			if(m_SameCards[i].count == 4)
			{
				assert(m_nSameCount <= 2);	// 4条的情况下，m_nSameCount不应该大于2
				m_nTypeHands = TYPE_FOUR_KIND;
				FilterFourCard(m_SameCards[i].pos);	// 调用Filter程序取出4条,放入优选数组
				return true;
			}
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检测是否葫芦 Full House
	///////////////////////////////////////////////////////////////////////////
	bool CheckFullHouse(void)
	{
		if(m_nThreeKindCount < 1)
			return false;	// 没有三条, 不能组成Full House
		if(m_nThreeKindCount == 1 && m_nPairCount < 1)
			return false;	// 有三条没对子, 不能组成Full House

		m_nTypeHands = TYPE_FULL_HOUSE;
		FilterFullHouse();
		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检测是否同花 Flush
	///////////////////////////////////////////////////////////////////////////
	bool CheckFlush(void)
	{
		if(m_nFlushColor == 0)
			return false;
		m_nTypeHands = TYPE_FLUSH;
		FilterFlush();

		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查是否顺子 Straight
	///////////////////////////////////////////////////////////////////////////
	bool CheckStraight(void)
	{
		int nPos = IsStraight(false);
		if(nPos != -1)
		{
			// 缺省为普通同花顺子
			m_nTypeHands = TYPE_STRAIGHT;
			FilterStraight(nPos, false);
			return true;
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查是否三条 Three of a kind
	///////////////////////////////////////////////////////////////////////////
	bool CheckThreeCard(void)
	{
		if(m_nThreeKindCount < 1)
			return false;

		m_nTypeHands = TYPE_THREE_KIND;
		FilterThreeCard();

		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查是否两对 Two pair
	///////////////////////////////////////////////////////////////////////////
	bool CheckTwoPair(void)
	{
		if(m_nPairCount < 2)
			return false;

		m_nTypeHands = TYPE_TWO_PAIRS;
		FilterTwoPair();

		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查是否对子
	///////////////////////////////////////////////////////////////////////////
	bool CheckPair(void)
	{
		if(m_nPairCount < 1)
			return false;

		m_nTypeHands = TYPE_PAIR;
		FilterPair();

		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// 检查高牌或杂牌 High Card & Pie Card
	///////////////////////////////////////////////////////////////////////////
	bool CheckHighCard(void)
	{
		m_nTypeHands = TYPE_HIGH_CARD;
		FilterHighCard();

		return true;
	}
public:
	///////////////////////////////////////////////////////////////////////////
	// 测试用函数定义

	///////////////////////////////////////////////////////////////////////////
	// 调试显示牌型信息
	///////////////////////////////////////////////////////////////////////////
	//void ShowHandsType(void)
	//{
	//	DebugHands();
	//}
	////DEBUG
	//void DebugCards(void)
	//{
	//	TRACE("-------------------------------------------------------------------------\r\n");
	//	TRACE("Cards: ");
	//	for(int i = 0; i < TOTAL_OF_CARDS; i ++)
	//		TRACE("[%s,%02d] ", show_poker_color(m_Cards[i].p_color), m_Cards[i].p_value);
	//}
	//void DebugHands(void)
	//{
	//	TRACE("Hands: ");
	//	for(int i = 0; i < TOTAL_OF_HANDS; i ++)
	//		TRACE("[%s,%02d] ", show_poker_color(m_pHands[i].p_color), m_pHands[i].p_value);
	//	TRACE("\t%s, %s\r\n", show_hands_type_cn(m_nTypeHands), show_hands_type(m_nTypeHands));
	//}
	//void DebugHands2(void)
	//{
	//	TRACE("Hands Type = %s, %s\r\n", show_hands_type(m_nTypeHands), show_hands_type_cn(m_nTypeHands));
	//	for(int i = 0; i < TOTAL_OF_HANDS; i ++)
	//		TRACE("%d:\t[%d, %d]\r\n", i, g_color[m_pHands[i].p_color], m_pHands[i].p_value);
	//}
	//void Test(void)
	//{	//[D,10] [A,08] [B,08] [B,08] [D,05] [B,02] [A,02] 
	//	UCHAR hands[14] = {
	//		2,14,	// 1
	//		4,11,	// 2
	//		1,8,	// 3
	//		1,2,	// 4
	//		2,8,	// 5
	//		3,8,	// 6
	//		4,5		// 7
	//	};
	//	SetHands(hands);
	//	SortCards();		// 1. 将牌从大到小依次排列，共7张
	//	CountFlush();		// 2. 统计牌中各花色的数量，检测是否有5张同花色的牌
	//	CountSameCards();	// 3. 统计牌中复数牌的数量，例如对子、三条或四条
	//	//DebugCards();

	//	DebugCards();
	//	if(CheckStraightFlush())
	//	{
	//		DebugHands();
	//		return ;
	//	}
	//	if(CheckFourCard())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckFullHouse())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckFlush())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckStraight())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckThreeCard())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckTwoPair())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	if(CheckPair())
	//	{
	//		DebugHands();
	//		return;
	//	}
	//	CheckHighCard();
	//	DebugHands();
	//}


};
