#include <string.h>
#include <omnetpp.h>
#include "Tictoc_ven_m.h"

using namespace omnetpp;


class centralHub : public cSimpleModule
{
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(centralHub);

void centralHub::initialize()
{
    if (strcmp("Node0", getName()) == 0) {

            TicTocMsg *msg1 = new TicTocMsg("hello");
            send(msg1, "out1");
            TicTocMsg *msg2 = new TicTocMsg("hello");
            send(msg2, "out2");
            TicTocMsg *msg3 = new TicTocMsg("hello");
            send(msg3, "out3");
            TicTocMsg *msg4 = new TicTocMsg("hello");
            send(msg4, "out4");
        }
}

void centralHub::handleMessage(cMessage *msg)
{

    if(msg->arrivedOn("in1")){
        send(msg, "out1");
    }
    if(msg->arrivedOn("in2")){
            send(msg, "out2");
        }
    if(msg->arrivedOn("in3")){
            send(msg, "out3");
        }
    if(msg->arrivedOn("in4")){
            send(msg, "out4");
        }

}
