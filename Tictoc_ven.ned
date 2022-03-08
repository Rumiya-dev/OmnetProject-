//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
simple endPointScenario1
{
    gates:
        input in;
        output out;
}

simple endPointScenario2
{
    gates:
        input in;
        output out;
}

simple forwarder
{
    gates:
        input in1;
        output out1;
        input in2;
        output out2;
}

simple centralHub
{
    gates:
        input in1;
        output out1;
        input in2;
        output out2;
        input in3;
        output out3;
        input in4;
        output out4;
}


network Scenario1
{
    @display("bgb=910,423");
    types:
    submodules:
        Node0: endPointScenario1 {
            @display("p=90,120");
        }
        Node4: endPointScenario1 {
            @display("p=90,307");
        }
        Node1: forwarder {
            @display("p=359,95");
        }
        Node2: forwarder {
            @display("p=423,226");
        }
        Node3: forwarder {
            @display("p=359,354");
        }
    connections:
        Node0.out --> {  delay = 100ms; } --> Node1.in1;
        Node1.out1 --> {  delay = 100ms; } --> Node2.in1;
        Node2.out1 --> {  delay = 100ms; } --> Node3.in1;
        Node3.out1 --> {  delay = 100ms; } --> Node4.in;
        Node4.out --> {  delay = 100ms; } --> Node3.in2;
        Node3.out2 --> {  delay = 100ms; } --> Node2.in2;
        Node2.out2 --> {  delay = 100ms; } --> Node1.in2;
        Node1.out2 --> {  delay = 100ms; } --> Node0.in;
}

network Scenario2
{
    @display("bgb=979,460");
    types:
    submodules:
        Node4: endPointScenario2 {
            @display("p=90,120");
        }
        Node3: endPointScenario2 {
            @display("p=90,307");
        }
        Node1: endPointScenario2 {
            @display("p=332.99124,119.18875");
        }
        Node2: endPointScenario2 {
            @display("p=332.99124,305.95874");
        }
        Node0: centralHub {
            @display("p=221.175,208.8875");
        }
    connections:
        Node4.out --> {  delay = 100ms; } --> Node0.in4;
        Node0.out4 --> {  delay = 100ms; } --> Node4.in;
        Node0.out1 --> {  delay = 100ms; } --> Node1.in;
        Node1.out --> {  delay = 100ms; } --> Node0.in1;
        Node0.out2 --> {  delay = 100ms; } --> Node2.in;
        Node2.out --> {  delay = 100ms; } --> Node0.in2;
        Node3.out --> {  delay = 100ms; } --> Node0.in3;
        Node0.out3 --> {  delay = 100ms; } --> Node3.in;
}


