pragma circom 2.0.0;

/* This circuit template checks that c is the multiplication of a and b. */

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 - in;
}

template Multiplier2() {

   // Declaration of signals.
   signal input a;
   signal input b;
   signal output c;

   // Logic gates if needed
   signal x;
   signal y;

   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;

   // Example of using gates; however, it doesn't affect the multiplication check
   signal temp;
   temp <== orGate.out;

   // Constraints.
   c <== a * b;
}

component main = Multiplier2();
