// This code is Copyright (c) Michael Hinz, portions are
// Copyright David H. Hovemeyer.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// 74xx165 input (serial)
#define RDIN  A0  // Inhibit
#define RDCP  A1  // Clock Pulse
#define RDPL  A2  // Parallel Load

// 74xx165 output (parallel)
#define D0    2
#define D1    3
#define D2    4
#define D3    5
#define D4    6
#define D5    7
#define D6    8
#define D7    9

// status LEDs
#define LED1  10  // to indicate ok, green
#define LED2  11  // to indicate error, red

// a port that is not connected, for randomness
#define PORT_NC A4

void pulseLowSlow(uint8_t pin) {
  digitalWrite(pin, LOW);
  delayMicroseconds(1);
  digitalWrite(pin, HIGH);
  delayMicroseconds(1);
}

void pulse(uint8_t pin) {
  digitalWrite(pin, HIGH);
  digitalWrite(pin, LOW);
}

void setup() {
  // initialize random number generator
  randomSeed(analogRead(PORT_NC));
  // configure the pins
  pinMode(D0, OUTPUT);
  pinMode(D1, OUTPUT);
  pinMode(D2, OUTPUT);
  pinMode(D3, OUTPUT);
  pinMode(D4, OUTPUT);
  pinMode(D5, OUTPUT);
  pinMode(D6, OUTPUT);
  pinMode(D7, OUTPUT);

  pinMode(RDIN, INPUT);
  pinMode(RDCP, OUTPUT);
  pinMode(RDPL, OUTPUT);

  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);

  // set clock low initially
  digitalWrite(RDCP, LOW);
  // set the parallel load high initially (not asserted, since it's a negative signal)
  digitalWrite(RDPL, HIGH);
}

void loop() {
  uint8_t rnd, res;
  uint8_t data;

  // switch both LEDs off
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  // generate random number
  rnd = random(255);
  // output on paralell pins
  // I'm lazy, so just check the bits one for one
  digitalWrite(D0,rnd & 1);
  digitalWrite(D1, rnd & 2);
  digitalWrite(D2, rnd & 4);
  digitalWrite(D3, rnd & 8);
  digitalWrite(D4, rnd & 16);
  digitalWrite(D5, rnd & 32);
  digitalWrite(D6, rnd & 64);
  digitalWrite(D7, rnd & 128);
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);

  // ok, the lines are loaded, let's get the serial result and compare
  // this part, and the subroutines used, are lifted from a very nice
  // eeprom programmer. That software is Copyright (c) 2019 by
  // David H. Hovemeyer <david.hovemeyer@gmail.com>. Read his copyright
  // in his git repository at https://github.com/daveho/eeprog
  pulseLowSlow(RDPL);
  data = 0;
  for (uint8_t i=0; i<8; i++) {
    data <<= 1;
    uint8_t val = digitalRead(RDIN);
    if (val) {
      data |= 0x1;
    }
    pulse(RDCP);
  }
  if (data == rnd) {
    digitalWrite(LED1, HIGH);
  } else {
    digitalWrite(LED2, HIGH);
  }
  // wait a bit before we go on, so the result can be seen
  delay(2000);  
}
