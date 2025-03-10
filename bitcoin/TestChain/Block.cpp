//
// Created by Dave Nash on 20/10/2017.
//

#include "Block.h"
#include "sha256.h"

Block::Block(uint32_t nIndexIn, const string &sDataIn) : _nIndex(nIndexIn), _sData(sDataIn)
{
    _nNonce = 0;
    _tTime = time(nullptr);

    sHash = _CalculateHash();
}

void Block::MineBlock(uint32_t nDifficulty)
{
	printf("begin mining\n");
    char cstr[nDifficulty + 1];
    for (uint32_t i = 0; i < nDifficulty; ++i)
    {
        cstr[i] = '0';
    }
    cstr[nDifficulty] = '\0';

    string str(cstr);

    while (sHash.substr(0, nDifficulty) != str)
    {
        _nNonce++;
        sHash = _CalculateHash();
    }

    cout << "Block mined: " << sHash << endl;
}

inline string Block::_CalculateHash() const
{
    stringstream ss;
    ss << _nIndex << "_" << sPrevHash << "_" <<  _tTime << "_"  << _sData << "_" << _nNonce;
    string hash = sha256(ss.str());
	printf("ss.str():%s, hash:%s\n", ss.str().c_str(), hash.c_str());

    return hash;
}
