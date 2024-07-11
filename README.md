# ZK SNARK Designer

## Project Overview

The **ZK SNARK Designer** project involves designing a zkSNARK circuit to implement specific logical operations using the circom programming language. The task includes creating the circuit, generating proofs, and deploying a verifier on-chain to validate these proofs.

### Objective

Create a zkSNARK circuit that implements logical operations and proves knowledge of specific inputs that yield a given output. Specifically, the goal is to prove knowledge of inputs A (0) and B (1) that produce an output of 0.


## Tools Used

- **circom**: To write and compile the zkSNARK circuit
- **Hardhat**: To deploy the verifier and manage the development environment
- **Solidity**: For the verifier contract
- **Sepolia or Mumbai Testnet**: For deployment


## Project Rubric

To successfully complete this project, ensure you:

1. Write a correct `circuit.circom` implementation.
2. Compile the circuit to generate intermediate files.
3. Generate a proof using inputs A=0 and B=1.
4. Deploy a Solidity verifier to Sepolia or Mumbai Testnet.
5. Call the `verifyProof()` method on the verifier contract and assert the output is true.

## Circuit Implementation Template

Here is the gates template:

```circom
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
   signal input a;
   signal input b;
   signal output c;

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

   signal temp;
   temp <== orGate.out;

   c <== a * b;
}

component main = Multiplier2();
```

## Deployment Steps

1. **Compile the Circuit**
   ```bash
   npx hardhat circom
   ```

2. **Deploy Verifier to Testnet**
   ```bash
   npx hardhat run scripts/deploy.ts --network sepolia
   ```

3. **Verify the Proof**
   After deploying, a verifier result is returned. Here is the result after deployment with inputs `A =0, B =1`. 

```bash
Verifier deployed to 0x4456ce0eBadB36Ad298Ff19ce4aC18075c4407Cb
Verifier result: true
```

## Author
This project was completed by Jeremiah Samuel. For support, please contact me via livinalt@gmail.com.


## License
This project is licensed under the GPL-3.0 License
