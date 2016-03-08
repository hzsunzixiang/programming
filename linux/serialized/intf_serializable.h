
#ifndef SERIALIZABLE_H
#define SERIALIZABLE_H

#include <stdint.h>
#include "byte_stream.h"

class ISerializable
{
public:
    virtual ~ISerializable() {};
    
public:
    virtual bool Serialize(CByteStreamNetwork& bs) = 0;  
};

#endif /* SERIALIZABLE_H */
