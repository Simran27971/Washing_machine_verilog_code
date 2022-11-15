`timescale 1ns / 1ps

module washing_machine_tb;
wire idle,soak_low,soak_high,wash_low,wash_high,rinse,spin,drain;
reg clk,rst,start,select,stop,timer_soak_low,timer_soak_high,timer_wash_low,timer_wash_high,timer_rinse,timer_spin,timer_drain;
  
washing_machine WA_tb(idle,soak_low,soak_high,wash_low,wash_high,rinse,spin,drain,clk,rst,start,select,stop,timer_soak_low,timer_soak_high,timer_wash_low,timer_wash_high,timer_spin,timer_rinse,timer_drain);
  initial clk=0;
  always #20 clk = ~clk;
initial
    begin
      $monitor("idle=%d; soak_low=%d; soak_high=%d; wash_low=%d; wash_high=%d; rinse=%d; spin=%d; drain=%d;cs=%d; start=%d; timer_soak_low=%d; timer_soak_high=%d; timer_wash_low=%d; timer_wash_high=%d; timer_spin=%d; timer_rinse=%d; stop=%d", idle,soak_low,soak_high,wash_low,wash_high,rinse,spin,drain,clk,start,timer_soak_low,timer_soak_high, timer_wash_low,timer_wash_high,timer_spin,timer_rinse,stop);
      
#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0;timer_rinse=0; timer_spin=0;  stop=0; rst=0; timer_drain=0; select=1;
      
#50      
start=1; timer_soak_low=0; timer_soak_high=1; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=0;select=1;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=1; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=0;select=1;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=1;select=1;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=1; stop=0; rst=0; timer_drain=1;select=1;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=1; timer_rinse=0; stop=0; rst=0; timer_drain=1;select=1;

#50      

start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0;timer_rinse=0; timer_spin=0;  stop=0; rst=0; timer_drain=0; select=0;
      
#50      
start=1; timer_soak_low=1; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=0;select=0;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=1; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=0;select=0;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=0; timer_drain=1;select=0;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=1; stop=0; rst=0; timer_drain=1;select=0;

#50      
start=1; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=1; timer_rinse=0; stop=0; rst=0; timer_drain=1;select=0;

#50
start=0; timer_soak_low=0; timer_soak_high=0; timer_wash_low=0; timer_wash_high=0; timer_spin=0; timer_rinse=0; stop=0; rst=1; timer_drain=0;select=1;

    
    end
endmodule

