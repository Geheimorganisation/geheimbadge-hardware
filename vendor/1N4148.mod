***********************************************************
*
* 1N4148
*
* Nexperia
*
* High-speed diodes
* IFmax = 200mA
* VRmax = 100V
* VFmax = 1V      @ IF = 10mA
* IRmax = 25nA    @ VR = 20V
*
*
*
* Package pinning does not match Spice model pinning.
* Package: SOD27 (DO-35)
* 
* Package Pin 1: Cathode
* Package Pin 2: Anode
*
*
*
* Extraction date (week/year): #
* Simulator: PSPICE
*
***********************************************************
*
* The resistor R1 does not reflect 
* a physical device. Instead it
* improves modeling in the reverse 
* mode of operation.
*
.SUBCKT 1N4148 1 2
R1 1 2 5.827E+9 
D1 1 2 1N4148
*
.MODEL 1N4148 D 
+ IS = 4.352E-9 
+ N = 1.906 
+ BV = 110 
+ IBV = 0.0001 
+ RS = 0.6458 
+ CJO = 7.048E-13 
+ VJ = 0.869 
+ M = 0.03 
+ FC = 0.5 
+ TT = 3.48E-9 
.ENDS
*