


// 这里仅仅是一个例子
template<typename T>
int SerializeHash(const T& obj)
{
	return 0;
}


class CBlockHeader
{
};


class CMutableTransaction
{
};

class CTransaction
{
};


int main()
{
	SerializeHash<CBlockHeader>(CBlockHeader());
	SerializeHash<CMutableTransaction>(CMutableTransaction());
	SerializeHash<CTransaction>(CTransaction());
	return 0;
}



