Maximize

145 dSta_0 + 501 d0_2.0 + 2547 d2_8.0 + 140 d8_3.0 + 502 d8_4.0 + 584 d3_4.0 + 140 d3_3.0 + 140 d3_3.1 + 3731 d4_7.0 + 173 d7_5.0 + 233 d7_6.0 + 233 d5_6.0 + 173 d5_5.0 + 201 d6_1.0


Subject to


\ === tcfg constraints ===
dSta_0 = 1
b0 - d0_2 = 0
b0 - dSta_0 = 0
b1 - d6_1 = 0
b2 - d2_8 = 0
b2 - d0_2 = 0
b3 - d3_4 - d3_3 = 0
b3 - d3_3 - d8_3 = 0
b3.0 - d3_3.0 - d8_3.0 = 0
b3.1 - d3_3.1 = 0
b4 - d4_7 = 0
b4 - d3_4 - d8_4 = 0
b5 - d5_6 - d5_5 = 0
b5 - d5_5 - d7_5 = 0
b5.0 - d5_5.0 - d7_5.0 = 0
b6 - d6_1 = 0
b6 - d5_6 - d7_6 = 0
b7 - d7_5 - d7_6 = 0
b7 - d4_7 = 0
b8 - d8_3 - d8_4 = 0
b8 - d2_8 = 0

\ === bus context constraints ===
m1.Sta_0 <= 1
m1.Sta_0 - m1.0 <= 1
m1.Sta_0 - m1.0 >= 0
m1.0 - m1.0_1 = 0
m1.0_1 + m1.1_1 - m1.1 <= 1
m1.0_1 + m1.1_1 - m1.1 >= 0
m1.1 - m1.1_1 = 0
m1.0 + m1.1 <= 7
m1.0_1 - m1.Sta_0 >= 0
m1.1_1 - m1.Sta_0 >= 0
m2.Sta_0 <= 1
m2.Sta_0 + m2.0_0 - m2.0 <= 1
m2.Sta_0 + m2.0_0 - m2.0 >= 0
m2.0 - m2.0_0 = 0
m2.0 <= 7
m2.0_0 - m2.Sta_0 >= 0

\ === tcfg loop header node bounds  ===
b3 <= 7
b5 <= 7

\ === tcfg node-context sum constraints ===
b0.0 - b0 = 0
b1.0 - b1 = 0
b2.0 - b2 = 0
b3.0 + b3.1 - b3 = 0
b4.0 - b4 = 0
b5.0 - b5 = 0
b6.0 - b6 = 0
b7.0 - b7 = 0
b8.0 - b8 = 0

\ === tcfg node-context bound constraints ===
b3 - m1.Sta_0 >= 0
b3.0 - m1.0 <= 0
b3.1 - m1.1 <= 0
b5 - m2.Sta_0 >= 0
b5.0 - m2.0 <= 0

\ === tcfg edge-context constraints ===
d0_2.0 - d0_2 = 0
d2_8.0 - d2_8 = 0
d8_3.0 - d8_3 = 0
d8_4.0 - d8_4 = 0
d3_4.0 - d3_4 = 0
d3_3.0 + d3_3.1 - d3_3 = 0
d4_7.0 - d4_7 = 0
d7_5.0 - d7_5 = 0
d7_6.0 - d7_6 = 0
d5_6.0 - d5_6 = 0
d5_5.0 - d5_5 = 0
d6_1.0 - d6_1 = 0


\ === user constraints (loop bound etc) ===
b2 = 1
b4 = 1
b6 = 1
b0 = 1
b1 = 1
b8+ b3- 8 b2 =  0
b7+ b5- 8 b4 =  0

Generals

dSta_0
b0
d0_2
b1
b2
d2_8
b3
d3_4
d3_3
b4
d4_7
b5
d5_6
d5_5
b6
d6_1
b7
d7_5
d7_6
b8
d8_3
d8_4
b0.0
b1.0
b2.0
b3.0
b3.1
b4.0
b5.0
b6.0
b7.0
b8.0
d0_2.0
d2_8.0
d8_3.0
d8_4.0
d3_4.0
d3_3.0
d3_3.1
d4_7.0
d7_5.0
d7_6.0
d5_6.0
d5_5.0
d6_1.0
m1.0
m1.1
m1.Sta_0
m1.0_1
m1.1_1
m2.0
m2.Sta_0
m2.0_0

End
