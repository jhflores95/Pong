`ifndef _my_incl_vh_
`define _my_incl_vh_

//
// Data width of each x and y
//

parameter DATA_WIDTH_COORD = 8;

//
// This file provides useful parameters and types for Lab 3.
// 

parameter SCREEN_WIDTH = 160;
parameter SCREEN_HEIGHT = 120;

// Use the same precision for x and y as it simplifies life
// A new type that describes a pixel location on the screen


typedef struct {
   reg [DATA_WIDTH_COORD-1:0] x;
   reg [DATA_WIDTH_COORD-1:0] y;
} point;

// A new type that describes a velocity.  Each component of the
// velocity can be either + or -, so use signed type

typedef struct {
   reg signed [DATA_WIDTH_COORD-1:0] x;
   reg signed [DATA_WIDTH_COORD-1:0] y;
} velocity;
  
//Colours.  
parameter BLACK = 3'b000;
parameter BLUE  = 3'b001;
parameter GREEN = 3'b010;
parameter CYAN = 3'b011;
parameter RED = 3'b100;
parameter PURPLE = 3'b101;
parameter YELLOW = 3'b110;
parameter WHITE = 3'b111;

// We are going to write this as a state machine.  The following
// is a list of states that the state machine can be in.

typedef enum int unsigned {INIT = 1 , START = 2, 
              DRAW_TOP_ENTER = 4, DRAW_TOP_LOOP = 8, 
              DRAW_RIGHT_ENTER = 16, DRAW_RIGHT_LOOP = 32,
              DRAW_LEFT_ENTER = 64, DRAW_LEFT_LOOP = 128, IDLE = 256, 
              ERASE_PADDLE_ENTER = 512, ERASE_PADDLE_LOOP = 1024, 
              DRAW_PADDLE_ENTER = 2048, DRAW_PADDLE_LOOP = 4096, 
              ERASE_PUCK = 8192, ERASE_PUCK2 = 16384, 
              DRAW_PUCK = 32768, DRAW_PUCK2 = 65536} draw_state_type;  

// Here are some parameters that we will use in the code. 
 
// These parameters contain information about the paddle 
parameter PADDLE_WIDTH = 10;  // width, in pixels, of the paddle
parameter PADDLE_ROW = SCREEN_HEIGHT - 2;  // row to draw the paddle 
parameter PADDLE_X_START = SCREEN_WIDTH / 2;  // starting x position of the paddle

// These parameters describe the lines that are drawn around the  
// border of the screen  
parameter TOP_LINE = 4;
parameter RIGHT_LINE = SCREEN_WIDTH - 5;
parameter LEFT_LINE = 5;

// These parameters describe the starting location for the puck(s)
parameter FACEOFF_X = SCREEN_WIDTH / 2 + 8;
parameter FACEOFF_Y = SCREEN_HEIGHT / 2;
parameter FACEOFF_X_2 = SCREEN_WIDTH / 2 - 8;
  
// Starting Velocity

// Ball moves top right (45 deg to horizontal)
parameter VELOCITY_START_X = 1;
parameter VELOCITY_START_Y = -1;

// Puck moves bottom right(-45 deg to horizontal)
parameter VELOCITY_START_X_2 = 1;
parameter VELOCITY_START_Y_2 = 1;
  
// This parameter indicates how many times the counter should count in the
// START state between each invocation of the main loop of the program.
// A larger value will result in a slower game.  The current setting will    
// cause the machine to wait in the start state for 1/14 of a second between 
// each invocation of the main loop.  The 50000000 is because we are
// clocking our circuit with a 50Mhz clock. 
  
parameter LOOP_SPEED = 50000000/14; 
  
`endif // _my_incl_vh_