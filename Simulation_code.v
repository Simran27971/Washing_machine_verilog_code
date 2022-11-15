`timescale 1ns / 1ps

module washing_machine(output reg idle,soak_low,soak_high,wash_low,wash_high,rinse,spin,drain,input clk,rst,start,select,stop,timer_soak_low,timer_soak_high,timer_wash_low,timer_wash_high,timer_spin,timer_rinse,timer_drain);


reg [2:0]cs,ns;    //cs- current state, ns-next state

// Defining parameters(States)

parameter IDLE=3'b000;
parameter SOAK=3'b001;
parameter SOAK2=3'b111;
parameter WASH=3'b010;
parameter WASH2=3'b011;
parameter DRAIN=3'b100;
parameter RINSE=3'b101;
parameter SPIN=3'b110;




always@(cs or start or timer_soak_low or timer_soak_high or timer_wash_low or timer_wash_high or timer_spin or timer_rinse  or timer_drain or stop)

begin

case(cs)
IDLE:
     if(start==1 && select==0 && timer_soak_low==1 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_rinse==0 && timer_drain==0 && stop==0)
                         begin
                         ns<=SOAK;
                         soak_low<=1;
                         soak_high<=0;
                         wash_low<=0;
                         wash_high<=0;
                         drain<=0;
                         rinse<=0;
                         spin<=0;
                         idle<=0;
                         end
     else if(start==1 && select==1 && timer_soak_low==0 && timer_soak_high==1 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_drain==0 && timer_rinse==0  && stop==0)
                        begin
                        ns<=SOAK2;
                        soak_low<=0;
                        soak_high<=1;
                        wash_low<=0;
                        wash_high<=0;
                        drain<=0;
                        rinse<=0;
                        spin<=0;
                        idle<=0;
                        end
      else
                        begin
                        ns<=cs;
                        soak_low<=0;
                        soak_high<=0;
                        wash_low<=0;
                        wash_high<=0;
                        drain<=0;
                        rinse<=0;
                        spin<=0;
                        idle<=0;
                        end
        
SOAK:
           if(start==1 && select==0 && timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==1 && timer_wash_high==0 && timer_spin==0 && timer_drain==0 && timer_rinse==0  && stop==0)
                           begin
                            ns<=WASH;
                            soak_low<=0;
                            soak_high<=0;
                            wash_low<=1;
                            wash_high<=0;
                            drain<=0;
                            rinse<=0;
                            spin<=0;
                            idle<=0;
                            end

            else if(stop==1)
                begin
                ns<=IDLE;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=1;
                end
                
            else
                begin
                ns<=cs;
                soak_low<=1;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=0;
                end
                
SOAK2:
           if(start==1 && select==1 && timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==1 && timer_spin==0 && timer_drain==0 && timer_rinse==0  && stop==0)
                            begin
                            ns<= WASH2;
                            soak_low<=0;
                            soak_high<=0;
                            wash_low<=0;
                            wash_high<=1;
                            drain<=0;
                            rinse<=0;
                            spin<=0;
                            idle<=0;
                            end
            else if(stop==1)
                begin
                ns<=IDLE;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=1;
                end
                
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=1;
                wash_low<=0;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=0;
                end
                            
            
WASH:
            if(start==1 && select==0 && timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_drain==1 && timer_rinse==0  && stop==0)
                                begin
                                ns<=DRAIN;
                                soak_low<=0;
                                soak_high<=0;
                                wash_low<=0;
                                wash_high<=0;
                                drain<=1;
                                rinse<=0;
                                spin<=0;
                                idle<=0;
                                end
            else if(stop==1)
                           begin
                           ns<=IDLE;
                           soak_low<=0;
                           soak_high<=0;
                           wash_low<=0;
                           wash_high<=0;
                           drain<=0;
                           rinse<=0;
                           spin<=0;
                           idle<=1;
                           end  
                
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=0;
                wash_low<=1;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=0;
                end  
                        
WASH2:
      if(start==1 && select==1 && timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_drain==1 && timer_rinse==0  && stop==0)
                                begin
                                ns<=DRAIN;
                                soak_low<=0;
                                soak_high<=0;
                                wash_low<=0;
                                wash_high<=0;
                                drain<=1;
                                rinse<=0;
                                spin<=0;
                                idle<=0;
                                end
            else if(stop==1)
                           begin
                           ns<=IDLE;
                           soak_low<=0;
                           soak_high<=0;
                           wash_low<=0;
                           wash_high<=0;
                           drain<=0;
                           rinse<=0;
                           spin<=0;
                           idle<=1;
                           end                  
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=1;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=0;
                end 
                
                
DRAIN:
            if(start==1 &&  timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_drain==1 && timer_rinse==1  && stop==0)
                             begin
                             ns<=RINSE;
                             soak_low<=0;
                             soak_high<=0;
                             wash_low<=0;
                             wash_high<=0;
                             drain<=1;
                             rinse<=1;
                             spin<=0;
                             idle<=0;
                             end
            else if(stop==1)
                           begin
                           ns<=IDLE;
                           soak_low<=0;
                           soak_high<=0;
                           wash_low<=0;
                           wash_high<=0;
                           drain<=0;
                           rinse<=0;
                           spin<=0;
                           idle<=1;
                           end  
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=1;
                rinse<=0;
                spin<=0;
                idle<=0;
                end 
        
RINSE:
            if(start==1 &&  timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==1 && timer_drain==1 && timer_rinse==0  && stop==0)
                             begin
                             ns<=SPIN;
                             soak_low<=0;
                             soak_high<=0;
                             wash_low<=0;
                             wash_high<=0;
                             drain<=1;
                             rinse<=0;
                             spin<=1;
                             idle<=0;
                             end 
            else if(stop==1)
                           begin
                           ns<=IDLE;
                           soak_low<=0;
                           soak_high<=0;
                           wash_low<=0;
                           wash_high<=0;
                           drain<=0;
                           rinse<=0;
                           spin<=0;
                           idle<=1;
                           end              
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=1;
                rinse<=1;
                spin<=0;
                idle<=0;
                end 
        
SPIN:
            if(start==1 &&  timer_soak_low==0 && timer_soak_high==0 && timer_wash_low==0 && timer_wash_high==0 && timer_spin==0 && timer_drain==0 && timer_rinse==0  && stop==0)
                             begin
                             ns<=IDLE;
                             soak_low<=0;
                             soak_high<=0;
                             wash_low<=0;
                             wash_high<=0;
                             drain<=0;
                             rinse<=0;
                             spin<=0;
                             idle<=1;
                             end 
            else if(stop==1)
                           begin
                           ns<=IDLE;
                           soak_low<=0;
                           soak_high<=0;
                           wash_low<=0;
                           wash_high<=0;
                           drain<=0;
                           rinse<=0;
                           spin<=0;
                           idle<=1;
                           end                               
            else
                begin
                ns<=cs;
                soak_low<=0;
                soak_high<=0;
                wash_low<=0;
                wash_high<=0;
                drain<=0;
                rinse<=0;
                spin<=0;
                idle<=0;
                end 
        
        default:
            ns<=IDLE;
                
endcase
end

always @(posedge clk or negedge rst)
begin
   if (rst)
     cs <= IDLE;
    else
     cs <= ns;
 end
 endmodule

            
            
            

            
            
            
            
            
            
            
            

            
         
            
            
            





























