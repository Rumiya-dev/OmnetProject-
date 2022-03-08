#include <string.h>
#include <omnetpp.h>
#include "Tictoc_ven_m.h"

using namespace omnetpp;


class endPointScenario2 : public cSimpleModule
{
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(endPointScenario2);

void endPointScenario2::initialize()
{
   
    if (strcmp("Node0", getName()) == 0) {
       
        TicTocMsg *msg = new TicTocMsg("hello");
        send(msg, "out");
    }
}

void endPointScenario2::handleMessage(cMessage *msg)
{

    send(msg, "out"); // toc back

}
