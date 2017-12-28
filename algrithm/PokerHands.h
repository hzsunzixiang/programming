#pragma once
#include "PokerGlobal.h"
#include "GameConfig.h"
#include <assert.h>


static int TOTAL_OF_CARDS = 7;
//////////////////////////////////////////////////////////////////////////////
// PokerHands һ���ƣ��ڵ����˿��У�ͨ��7��Ϊһ����
//////////////////////////////////////////////////////////////////////////////
class CPokerHands
{
public:
	CPokerHands(void)
	{
		Initialize();
	};
private:
	// ԭʼ7����
	//POKERCARD m_Cards[TOTAL_OF_CARDS];
	POKERCARD m_Cards[7];
	// ��ѡ�������5����
	POKERCARD *m_pHands;
	// ͬ����ֵ�����ṹ
	SAME_CARDS_COUNT m_SameCards[3];
	// ��ɫͳ������, ��¼7������, 4�ֻ�ɫ��������
	UCHAR m_ColorCount[4];
	// ��¼�Ƿ�ͬ��, 0 ֵ����ͬ��, ������ʾͬ���Ļ�ɫ
	UCHAR m_nFlushColor;
	// ͬ����ֵ������
	UCHAR m_nSameCount;
	// ����ͳ�� 7������ʱ�����3������
	UCHAR m_nPairCount ;	
	// ����ͳ�� 7������ʱ�����2������
	UCHAR m_nThreeKindCount;
	// ���ŵ�5���Ƶ�����
	UCHAR m_nTypeHands ;
public:
	///////////////////////////////////////////////////////////////////////////
	// ���ⲿ���ù����ĺ�������

	///////////////////////////////////////////////////////////////////////////
	// ��ȡ���� The Poker Hand Type
	///////////////////////////////////////////////////////////////////////////
	int GetHandsType(void) {return m_nTypeHands;};
	///////////////////////////////////////////////////////////////////////////
	// ������Ͳ���ѡ������5����
	///////////////////////////////////////////////////////////////////////////
	void CheckHandsType(POKERCARD *pHand)
	{
		// �����Ƿ�SetHands���ù�������
		if(m_Cards[0].p_card==0)
			return;
		//assert(m_Cards[0].p_card != 0);
		m_pHands = pHand;

		// �����˿��㷨����  ��ͳ�ƻ�ɫ��Ŀ���� ͬ��ɫ�� ��ǰ��
		CountFlush();		// 2. ͳ�����и���ɫ������������Ƿ���5��ͬ��ɫ����
		SortCards();		// 1. ���ƴӴ�С�������У���7��
		CountSameCards();	// 3. ͳ�����и����Ƶ�������������ӡ�����������
							// 4. ���δ�������͵���С���ͽ��м��, ��ѡ�����ŵ�5��
		if(CheckStraightFlush())return;	// ͬ��˳ Royal Flush & Straight Flush
		if(CheckFourCard())		return;	// ���� Four of a kind
		if(CheckFullHouse())	return;	// ��« Full House
		if(CheckFlush())		return;	// ͬ�� Flush
		if(CheckStraight())		return;	// ˳�� Straight
		if(CheckThreeCard())	return;	// ���� Three of a kind
		if(CheckTwoPair())		return;	// ���� Two Pair
		if(CheckPair())			return;	// һ�� Pair
		if(CheckHighCard())		return;	// ���� High Card
		assert(0);						// ���ӦΪ TYPE_PIE_CARD������Big Bug
	}	
int GetHandCardTypeWithCard(USHORT card1,USHORT card2)
	{
		int nRet=-1;
		USHORT sColor=0xFF00;
		USHORT sValue=0x00FF;
		USHORT sA=0x000E;//ֵΪA
		USHORT sJ=0x000B;//ֵΪJ
		USHORT s2=0x0002;//ֵΪ2
		USHORT sF=0x0100;//��ɫΪ����
		USHORT sH=0x0400;//��ɫΪ����
		bool bIsFlush=false;
		bool bIsStraight=false;
		bool bIsPair=false;
		bool bIsCardValid=false;
		
		//�������Ȱ�ֵ�����ٰ���ɫ���򣬱�֤card1һ������card2
		USHORT tmp=card1;
		if( (card1 & sValue) < (card2 & sValue)) //�Ȱ�ֵ����
		{
			tmp=card1;
			card1=card2;
			card2=tmp;
		}
		if( (card1 & sValue) == (card2 & sValue) )//��ֵ��ȣ��򰴻�ɫ����
		{
	        bIsPair=true;//����
	        if((card1 & sColor) < (card2 & sColor))
	        {
				tmp=card1;
	            card1=card2;
	            card2=tmp;
	        }
	        
		}
		//������Ƶ�ֵ�Ƿ���Ч
		if( ((card1 & sColor)<=sH) && ((card1 & sValue)<=sA))
			bIsCardValid=true;
		if( (bIsCardValid && (card2 & sColor)>=sF)  && ((card2 & sValue)>=s2) )
			bIsCardValid=true;
		if(!bIsCardValid)
	    {
			return nRet;
	    }
			
			
		//������ͳ��
		if(!bIsPair && (card1 & sColor) == (card2 & sColor))//���Ƶ�ͬ��
			bIsFlush=true;
		int nDiffer =(int)((card1 & sValue) - (card2 & sValue));
		if(!bIsPair && (nDiffer==1 || nDiffer==12))//���Ƶ�˳�ӣ�ע�⣬�˴� A��2 ��Ϊһ��˳��
			bIsStraight=true;

	    if(!bIsFlush && !bIsStraight && !bIsPair)
	    {
	        if( (card1 & sValue)== sA && ((card2 & sValue)>=sJ && (card2 & sValue)<sA) )
	            return HAND_CARD_TYPE_UNFLUSH_AQ_OR_AJ;
	        return HAND_CARD_TYPE_PIE;
	    }

	    if(bIsFlush)//ͬ��
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
			
		if(bIsPair)//����
		{
			if((card1 & sValue)>=s2 && (card1 & sValue)<sJ)
				return HAND_CARD_TYPE_PAIR_2_TO_10;//��2����10
			if((card1 & sValue)>=sJ && (card1 & sValue)<sA)
				return HAND_CARD_TYPE_PAIR_J_TO_K;//��J����K
			if((card1 & sValue)==sA)
				return HAND_CARD_TYPE_PAIR_A;//��A
		}
	    
	    return nRet;
	}	
	///////////////////////////////////////////////////////////////////////////
	// ��ʼ���ڲ����б������ظ����ö���ʱ�ɵ���
	///////////////////////////////////////////////////////////////////////////
	void Initialize(void)
	{
		m_nFlushColor = 0;		// ��ʼ��ͬ����־
		m_nSameCount = 0;		// ����������
		m_nPairCount = 0;		// ��������
		m_nThreeKindCount = 0;	// ��������
		m_nTypeHands = 0;		// ���ͣ���С����Ӧ��1��ʼ TYPE_PIE_CARD
		m_pHands = NULL;

		// ��ʼ����������
		memset(m_Cards, 0, sizeof(m_Cards));
		memset(m_ColorCount, 0, sizeof(m_ColorCount));
		memset(m_SameCards, 0, sizeof(m_SameCards));
	}
	///////////////////////////////////////////////////////////////////////////
	// ������ֵ
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

			// ������ֵ��Χ 2 - 14
			assert(m_Cards[i].p_value >= 2 && m_Cards[i].p_value <= 14);
			// �������滨ɫ 1 - 4 �ں�÷��
			assert(m_Cards[i].p_color >= 1 && m_Cards[i].p_color <= 4);
		}
	}
private:
	///////////////////////////////////////////////////////////////////////////
	// �ڲ������������忪ʼ

	///////////////////////////////////////////////////////////////////////////
	// ��һ���ƴӴ�С�������� Ace = 14
	///////////////////////////////////////////////////////////////////////////
	void SortCards(void)   // ֻ���д�С ���ܻ�ɫ
	{
		USHORT temp, max;
		for(int i = 0; i < TOTAL_OF_CARDS; i ++)
		{
			max = i;
			if(m_Cards[i].p_card == 0) //����ƷǷ�����
				return;
			for(int j = i + 1; j < TOTAL_OF_CARDS; j ++)
			{	
				if(m_Cards[j].p_card == 0)
					continue;
				if((m_Cards[j].p_value > m_Cards[max].p_value))
					max = j;
				/////////// ��ͬ���߷�ǰ
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
	// ���һ������ͬ����ɫ�����Ƿ����5��
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
				break;// �������ͬ��
			}
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// ͳ��һ��7������, ���ӣ�����������������
	///////////////////////////////////////////////////////////////////////////
	void CountSameCards(void)  // ��ʱ�Ѿ��ź���
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
	// ��¼���ӡ��������������ڵ�λ�ü������� ����CountSameCards����
	///////////////////////////////////////////////////////////////////////////
	void set_same_cards(int nPos, int nCount)
	{
		m_SameCards[m_nSameCount].pos = nPos - nCount;	// λ�ü��������ó�������ʼλ��
		m_SameCards[m_nSameCount].count = nCount;
		assert(m_nSameCount < 3);	// ����һ�����в����ܳ���3�����
		m_nSameCount ++;		// �ܵĶ��Ƽ���
		switch(nCount)
		{
		case 2:
			m_nPairCount ++;	// ���Ӽ���
			break;
		case 3:
			m_nThreeKindCount ++;// ��������
			break;
		};
	}
	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ�˳��		bFlush = true ���ʱ�Ƿ��ǻ�ɫ����
	// ���� = -1 ˵������˳��
	// ���� >= 4 ˳�����ұߵ�����CARDS�е�λ��, ��Ace����,Ace�Ǵ���, ���������
	// ����ֵ != -1:
	//		> ���ڲ�����С��[ͬ��]˳��,��Ϊ�ѽ��������ԭʼ7������[ע��Ace��ֵ��14,���]��m_Cards[TOTAL_OF_CARDS],
	//				�պù���[ͬ��]˳�ӵ����һ���Ƶ��±�index
	//		> ע���������С��˳����Ϊ: 100 + index
	// ����ֵʾ��:
	//		> ͬ��˳(������ֵ����ɫ),m_Cards => [A(1), 5(1), 5(2), 4(1), 3(1), 2(1), 2(3)],�򷵻� (100 + 5)
	//		> ��ͨ˳��(������ֵ����ɫ),m_Cards => [6(1), 5(3), 5(2), 4(1), 3(2), 2(1), 2(3)],�򷵻� (5)
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
					continue; // ���˳����ʼ�ƵĻ�ɫ��ͬ��, ��SKIP

				nCount = 1;
				pos = m_Cards[i-1].p_value;
			}
			if(bFlush && m_Cards[i].p_color != m_nFlushColor)	// ��ɫ�Ƿ�һ��
				continue;
			
			// ���˳����ʼ��, ������N���ƹ���˳��,��COUNT++����
			if(pos == m_Cards[i].p_value + nCount)
			{
				// ��� A��2��3��4��5
				if(++nCount == 4 && pos == 5 && m_Cards[0].p_value == 14)
				{
					if(!bFlush || m_Cards[0].p_color == m_nFlushColor)
						return 100 + i;
				}
				// ��5�ż���˳��
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
	// ��ȡ��ѡ���㷨�������忪ʼ

	///////////////////////////////////////////////////////////////////////////
	// ��ȡͬ��˳��,��˳��  bFlush = true ͬ��ѡ��
	// ��m_Cards 7 ������ɸѡ������5��˳��, �����A,2,3,4,5 ��Ace�������ұ�
	// ���� bFlush = true ֻɸѡͬ��, bFlush = false ���Ի�ɫ
	///////////////////////////////////////////////////////////////////////////
	void FilterStraight(int nPos, bool bFlush = true)
	{
		int handpos = TOTAL_OF_HANDS - 1;	// handpos ����������Ҷ����η�������

		// nPos > 100 �����Ϊ��С˳��,��: A,2,3,4,5, ����Ϊ��ͨ˳��
		if(nPos > 100)
		{
			nPos -= 100;
			int nAcePos = 0;

			if(bFlush)	// �����ͬ��,����ѭ����ȡ��ͬ��ɫ������Ace
			{
				for(int i = 0; i < 2; i ++)// ��SortCards��Ϊ�н�ͬ��С������ͬ�����Ʒ�ǰ��,��AceֵΪ14���������ж�ǰ�����ݾͿ���
				{
					if(m_Cards[i].p_color == m_nFlushColor)
					{
						nAcePos = i;
						break;
					}
				}
			}
			// ��ȡA,2,3,4,5�е�Ace��, ��ʱAceΪС��, ���������е����ұ�
			m_pHands[handpos--].p_card = m_Cards[nAcePos].p_card;
		}
		// ��ʼѭ��, ����������ȡ˳��
		while(handpos >= 0)
		{
			if(bFlush)// bFlush = true ȡͬ��˳��
			{
				if(m_Cards[nPos].p_color != m_nFlushColor)	// ��ɫ��ͬ SKIP
				{
					nPos --; 
					continue;
				}
			}else	// bFlush = false ȡ��ͨ˳��
			{
				if(handpos < TOTAL_OF_HANDS - 1 &&
					m_pHands[handpos+1].p_value == m_Cards[nPos].p_value)   // ���ﲻ�����
				{
						nPos --;
						continue;
				}
			}
			// ��ȡ˳��
			m_pHands[handpos--].p_card = m_Cards[nPos--].p_card;
		}
		// ���˳�ӵĵ�һ��ΪA, ��Ϊ�ʼ�ͬ��˳
		if(bFlush && m_pHands[0].p_value == 14)
			m_nTypeHands = TYPE_ROYAL_FLUSH;
	}
	///////////////////////////////////////////////////////////////////////////
	// ��ȡ���� Four of a Kind
	///////////////////////////////////////////////////////////////////////////
	void FilterFourCard(int nPos)
	{
		// ��ȡ4����4����
		m_pHands[0].p_card = m_Cards[nPos].p_card ;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card ;
		m_pHands[2].p_card = m_Cards[nPos+2].p_card ;
		m_pHands[3].p_card = m_Cards[nPos+3].p_card ;

		// ��ȡ�������͵ĵ�5�� Kickers �����
		nPos = nPos == 0 ? 4 : 0;
		m_pHands[4].p_card = m_Cards[nPos].p_card;
	}
	///////////////////////////////////////////////////////////////////////////
	// ��������, �ҳ���ȡ����һ������,�������ҷ�����ѡ����
	///////////////////////////////////////////////////////////////////////////
	void FilterFirstThreeCard(void)
	{
		int nPos = -1;
		// �ҳ���һ���������ڵ�λ��
		for(int i = 0; i < m_nSameCount; i ++)
		{
			if(m_SameCards[i].count == 3)
			{
				nPos = m_SameCards[i].pos;
				break;
			}
		}
		assert(nPos != -1);
		// ѭ��3��, ȡ������
		for(int i = 0; i < 3; i ++)
			m_pHands[i].p_card = m_Cards[nPos+i].p_card;
	}
	///////////////////////////////////////////////////////////////////////////
	// ��ȡ��« Full House
	///////////////////////////////////////////////////////////////////////////
	void FilterFullHouse(void)
	{
		int nPos = 0;

		// ȡFull House�����еĵ�һ������
		FilterFirstThreeCard();

		// m_nThreeKindCount > 1 ˵������������, ���������������Ի�һ��
		if(m_nThreeKindCount > 1)
		{
			// ȡ�õڶ���������ǰ����
			nPos = m_SameCards[1].pos;
			m_pHands[3].p_card = m_Cards[nPos].p_card;
			m_pHands[4].p_card = m_Cards[nPos+1].p_card;
		}else
		{
			// �ҳ���������λ��
			for(int i = 0; i < m_nSameCount; i ++)
			{
				if(m_SameCards[i].count == 2)
				{
					nPos = m_SameCards[i].pos;
					break;
				}
			}
			// ȡ�������ӵ�������
			m_pHands[3].p_card = m_Cards[nPos].p_card;
			m_pHands[4].p_card = m_Cards[nPos+1].p_card;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// ��ȡͬ�� Flush, �������򣬴Ӵ�С��ѡ��5��ͬ��
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
	// ��ȡ���� Three of a kind
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
	// ��ȡ���� Two pair
	///////////////////////////////////////////////////////////////////////////
	void FilterTwoPair(void)
	{
		assert(m_SameCards[0].count == 2);
		assert(m_SameCards[1].count == 2);

		// ȡ����һ��
		int nPos = m_SameCards[0].pos;
		m_pHands[0].p_card = m_Cards[nPos].p_card;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card;
		
		// ȡ���ڶ���
		nPos = m_SameCards[1].pos;
		m_pHands[2].p_card = m_Cards[nPos].p_card;
		m_pHands[3].p_card = m_Cards[nPos+1].p_card;

		// ȡ������� Two Pair�е�Kickers�����
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
	// ��ȡ���� Pair
	///////////////////////////////////////////////////////////////////////////
	void FilterPair(void)
	{
		assert(m_SameCards[0].count == 2);
		// ȡ����һ��
		int nPos = m_SameCards[0].pos;
		m_pHands[0].p_card = m_Cards[nPos].p_card;
		m_pHands[1].p_card = m_Cards[nPos+1].p_card;

		// ȡ������� Pair�����ŵ�Kickers�����
		for(int i = 0, n = 2; i < TOTAL_OF_CARDS && n < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card != 0 && m_Cards[i].p_value != m_pHands[0].p_value)
				m_pHands[n++].p_card = m_Cards[i].p_card;
		}
	}
	///////////////////////////////////////////////////////////////////////////
	// ��ȡ���� High Card
	///////////////////////////////////////////////////////////////////////////
	void FilterHighCard(void)
	{
		// �Ӵ�С ����ǰ5����
		for(int i = 0; i < TOTAL_OF_HANDS; i ++)
		{
			if(m_Cards[i].p_card == 0)
				continue;
			m_pHands[i].p_card = m_Cards[i].p_card;
		}

		// ��������ƴ���J, ��Ϊ���͸��� High Card, ����Ϊ���� Pie Card
		if(m_pHands[0].p_value < 11)
			m_nTypeHands = TYPE_PIE_CARD;
	}
private:
	///////////////////////////////////////////////////////////////////////////
	// �����ѡ���㷨�������忪ʼ

	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ�ͬ��˳ Royal Fulsh
	///////////////////////////////////////////////////////////////////////////
	bool CheckStraightFlush(void)
	{
		if(m_nFlushColor == 0)
			return false;

		int nPos = IsStraight(true);
		if(nPos != -1)
		{
			// ȱʡΪ��ͨͬ��˳��
			m_nTypeHands = TYPE_STRAIGHT_FLUSH;
			FilterStraight(nPos, true);
			return true;
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ����� Four of a Kind
	///////////////////////////////////////////////////////////////////////////
	bool CheckFourCard(void)
	{
		// ѭ������Ƿ����4��, ��ֹ���� A,A,A,5,5,5,5 ����
		for(int i = 0; i < m_nSameCount; i ++)
		{
			if(m_SameCards[i].count == 4)
			{
				assert(m_nSameCount <= 2);	// 4��������£�m_nSameCount��Ӧ�ô���2
				m_nTypeHands = TYPE_FOUR_KIND;
				FilterFourCard(m_SameCards[i].pos);	// ����Filter����ȡ��4��,������ѡ����
				return true;
			}
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ��« Full House
	///////////////////////////////////////////////////////////////////////////
	bool CheckFullHouse(void)
	{
		if(m_nThreeKindCount < 1)
			return false;	// û������, �������Full House
		if(m_nThreeKindCount == 1 && m_nPairCount < 1)
			return false;	// ������û����, �������Full House

		m_nTypeHands = TYPE_FULL_HOUSE;
		FilterFullHouse();
		return true;
	}
	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ�ͬ�� Flush
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
	// ����Ƿ�˳�� Straight
	///////////////////////////////////////////////////////////////////////////
	bool CheckStraight(void)
	{
		int nPos = IsStraight(false);
		if(nPos != -1)
		{
			// ȱʡΪ��ͨͬ��˳��
			m_nTypeHands = TYPE_STRAIGHT;
			FilterStraight(nPos, false);
			return true;
		}
		return false;
	}
	///////////////////////////////////////////////////////////////////////////
	// ����Ƿ����� Three of a kind
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
	// ����Ƿ����� Two pair
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
	// ����Ƿ����
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
	// �����ƻ����� High Card & Pie Card
	///////////////////////////////////////////////////////////////////////////
	bool CheckHighCard(void)
	{
		m_nTypeHands = TYPE_HIGH_CARD;
		FilterHighCard();

		return true;
	}
public:
	///////////////////////////////////////////////////////////////////////////
	// �����ú�������

	///////////////////////////////////////////////////////////////////////////
	// ������ʾ������Ϣ
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
	//	SortCards();		// 1. ���ƴӴ�С�������У���7��
	//	CountFlush();		// 2. ͳ�����и���ɫ������������Ƿ���5��ͬ��ɫ����
	//	CountSameCards();	// 3. ͳ�����и����Ƶ�������������ӡ�����������
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
