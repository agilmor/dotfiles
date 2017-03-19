#!/bin/bash

xinput set-prop 13 297 2, 3, 0, 0, 1, 2, 3 # Synaptics Tap Action           (297) # Which mouse button is reported when tapping, 0 disables an element. order: RT, RB, LT, LB, F1, F2, F3.
xinput set-prop 13 298 1, 2, 3             # Synaptics Click Action         (298) # Which mouse button is reported when clickin with number of fingers
xinput set-prop 13 290 -50 -50             # Synaptics Scrolling Distance   (290) # 32 bit, 2 values, vert, horiz
xinput set-prop 13 305 1 5                 # Synaptics Coasting Speed       (305) # FLOAT, 2 values, speed, friction
xinput set-prop 13 292 1 1                 # Synaptics Two-Finger Scrolling (292) # BOOL, 2 values, vertical, horizontal.

# xinput set-button-map 13 1 2 3 5 4 6 7 8 9 10 11 12 # Using negative Scrolling Distance
