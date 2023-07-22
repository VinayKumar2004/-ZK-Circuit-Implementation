pragma circom 2.0.0;

template Multiplier2() {
    //input 
    signal input a;
    signal input b;
    signal  x;
    signal  y;

    signal output c;


    // Define AND gate component.
    component ANDGate = AND();
    ANDGate.a <== a;
    ANDGate.b <== b;
    x <== ANDGate.out;

    // Define NOT gate component.
    component NOTGate = NOT();
    NOTGate.in <== b;
    y <== NOTGate.out;

    // Define OR gate component.
    component ORGate = OR();
    ORGate.a <== x;
    ORGate.b <== y;
    c<== ORGate.out;

}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
