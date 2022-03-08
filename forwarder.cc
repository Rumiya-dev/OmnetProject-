#include <string.h>
#include <omnetpp.h>
#include "Tictoc_ven_m.h"

using namespace omnetpp;


class forwarder : public cSimpleModule
{
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(forwarder);

void forwarder::initialize()
{
    //do nothing
}

void forwarder::handleMessage(cMessage *msg)
{

    if(msg->arrivedOn("in1")){
        send(msg, "out1");
    }else{
        send(msg, "out2");
    }


}
