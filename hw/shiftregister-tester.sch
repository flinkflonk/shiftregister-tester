EESchema Schematic File Version 4
LIBS:shiftregister-tester-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Shift Register Tester"
Date "2019-08-30"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ARDUINO_NANO:ARDUINO_NANO TB1
U 1 1 5D66DDCB
P 4200 3600
F 0 "TB1" H 4200 5167 50  0000 C CNN
F 1 "ARDUINO_NANO" H 4200 5076 50  0000 C CNN
F 2 "SHIELD_ARDUINO_NANO" H 4200 3600 50  0001 L BNN
F 3 "DFRobot" H 4200 3600 50  0001 L BNN
F 4 "Dev.kit: Arduino; UART; ICSP, USB B mini, pin strips" H 4200 3600 50  0001 L BNN "Field4"
F 5 "None" H 4200 3600 50  0001 L BNN "Field5"
F 6 "None" H 4200 3600 50  0001 L BNN "Field6"
F 7 "ARDUINO NANO" H 4200 3600 50  0001 L BNN "Field7"
F 8 "Unavailable" H 4200 3600 50  0001 L BNN "Field8"
	1    4200 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D66DEB9
P 5050 2300
F 0 "#PWR?" H 5050 2150 50  0001 C CNN
F 1 "+5V" H 5065 2473 50  0000 C CNN
F 2 "" H 5050 2300 50  0001 C CNN
F 3 "" H 5050 2300 50  0001 C CNN
	1    5050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D66DEF8
P 5050 2500
F 0 "#PWR?" H 5050 2250 50  0001 C CNN
F 1 "GND" H 5055 2327 50  0000 C CNN
F 2 "" H 5050 2500 50  0001 C CNN
F 3 "" H 5050 2500 50  0001 C CNN
	1    5050 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS165 U1
U 1 1 5D66DF54
P 6850 2850
F 0 "U1" H 6850 3928 50  0000 C CNN
F 1 "74LS165" H 6850 3837 50  0000 C CNN
F 2 "" H 6850 2850 50  0001 C CNN
F 3 "" H 6850 2850 50  0001 C CNN
	1    6850 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D66E004
P 7150 1950
F 0 "#PWR?" H 7150 1800 50  0001 C CNN
F 1 "+5V" H 7165 2123 50  0000 C CNN
F 2 "" H 7150 1950 50  0001 C CNN
F 3 "" H 7150 1950 50  0001 C CNN
	1    7150 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D66E035
P 6850 4000
F 0 "#PWR?" H 6850 3750 50  0001 C CNN
F 1 "GND" H 6855 3827 50  0000 C CNN
F 2 "" H 6850 4000 50  0001 C CNN
F 3 "" H 6850 4000 50  0001 C CNN
	1    6850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1950 7150 1950
Wire Wire Line
	6850 3850 6850 3900
Wire Wire Line
	4900 2500 5050 2500
Wire Wire Line
	4900 2300 5050 2300
NoConn ~ 4900 2400
Text GLabel 3500 4100 0    50   Input ~ 0
D0
Text GLabel 3500 4200 0    50   Input ~ 0
D1
Text GLabel 6350 2850 0    50   Output ~ 0
D5
Text GLabel 6350 2750 0    50   Output ~ 0
D4
Text GLabel 6350 2350 0    50   Output ~ 0
D0
Text GLabel 6350 2450 0    50   Output ~ 0
D1
Text GLabel 6350 2550 0    50   Output ~ 0
D2
Text GLabel 6350 2650 0    50   Output ~ 0
D3
Text GLabel 6350 2950 0    50   Output ~ 0
D6
Text GLabel 6350 3050 0    50   Output ~ 0
D7
Text GLabel 3500 4300 0    50   Input ~ 0
D2
Text GLabel 3500 4400 0    50   Input ~ 0
D3
Text GLabel 3500 4500 0    50   Input ~ 0
D4
Text GLabel 4900 3900 2    50   Input ~ 0
D5
Text GLabel 4900 4000 2    50   Input ~ 0
D6
Text GLabel 4900 4100 2    50   Input ~ 0
D7
Text GLabel 3500 3000 0    50   Output ~ 0
RDIN
Text GLabel 7350 2250 2    50   Input ~ 0
RDIN
Text GLabel 3500 3100 0    50   Output ~ 0
RDCP
Text GLabel 3500 3200 0    50   Output ~ 0
RDPL
Text GLabel 6350 3450 0    50   Input ~ 0
RDCP
Text GLabel 6350 3250 0    50   Input ~ 0
RDPL
Wire Wire Line
	6350 3550 6350 3900
Wire Wire Line
	6350 3900 6850 3900
Connection ~ 6850 3900
Wire Wire Line
	6850 3900 6850 4000
$EndSCHEMATC
