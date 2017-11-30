#pragma once

class ZNonCopyable {
protected:
	ZNonCopyable(){}
	~ZNonCopyable(){}

private:
	ZNonCopyable(const ZNonCopyable &rhs);
	ZNonCopyable& operator=(const ZNonCopyable &rhs);
};
