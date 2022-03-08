#include <string.h>
#include <omnetpp.h>
#include "Tictoc_ven_m.h"

using namespace omnetpp;


class endPointScenario1 : public cSimpleModule
{
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(endPointScenario1);

void endPointScenario1::initialize()
{
   
    if (strcmp("Node0", getName()) == 0) {
       
        TicTocMsg *msg = new TicTocMsg("hello");
        send(msg, "out");
    }
}

void endPointScenario1::handleMessage(cMessage *msg)
{


    if(strcmp("Node0", getName()) == 0){
        //do nothing
    }else{

        TicTocMsg *msg = new TicTocMsg("Hi");
        send(msg, "out"); // send out the message
    }


}
