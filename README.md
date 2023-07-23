# -ZK-Circuit-Implementation
A hardhat-circom  to generate for this circuit![image](https://github.com/VinayKumar2004/-ZK-Circuit-Implementation/assets/94241385/7ad735a9-e0f2-4ada-a8d7-78eff84f5722)
## Quick Start
Compile the Multiplier2() circuit and verify it against a smart contract verifier
```
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
```
# Install
npm i

## Compile
npx hardhat circom   This will generate the out file with circuit intermediaries and geneate the MultiplierVerifier.sol contract

## Prove and Deploy
```npx hardhat run scripts/deploy.ts ```
This script does 4 things

Deploys the MultiplierVerifier.sol contract
Generates a proof from circuit intermediaries with generateProof()
Generates calldata with generateCallData()
Calls verifyProof() on the verifier contract with calldata
# setup env file for privet key 
  run  npm i dotenv
  add this to your hardhat.config.jason 
  import 'dotenv/config';
  
   networks:{
  mumbai: {
    url: `https://rpc.ankr.com/polygon_mumbai`,
    accounts: [process.env.MUMBAIPRIVATEKEY]}},
    and create env file 
 Now  add mumbai test network to metamask account private key![image](https://github.com/VinayKumar2004/-ZK-Circuit-Implementation/assets/94241385/dafbd449-f612-49a5-885f-a2dba6a5281b)

 
 to depoly run this command 
 npx hardhat run scripts/deploy.ts --network mumbai
 
 and you can check your transaction on https://mumbai.polygonscan.com/ 
 
# Authors
Vinay Kumar 21BCS7595@cuchd.in

# License
This project is licensed under the Vinay Kumar License - see the LICENSE.md file for details
