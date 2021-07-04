#ifndef IDEMO_H__
#define IDEMO_H__

class IDemo 
{
public:
    virtual ~IDemo() {}
    virtual void TestDemo() = 0;
};

#endif // IDEMO_H__
