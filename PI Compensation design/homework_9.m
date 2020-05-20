%Homework 9 for ME2801
%Nise 9.1
%Enter in transfer function for plant
G = tf([1],conv([1 2 1],[1 10]));
%plot root locus as well as a grid that plots a damping ratio line, which
%intersects pole lines to give gain required to give that specific damping
%ratio
rlocus(G)
sgrid(0.6,[0:5:10]);
%estimated gain was 15.1 as can be seen in Kp.png. Now use this to create
%the closed loop transfer function and plot the step response and calculate
%performance metrics
Kp = 15.1;
T = feedback(Kp*G, 1);
step(T)
stepinfo(T)
%now time to design the PI controller
%create new PI design with a zero added near to the origin in order to 
%increase system type, without alowing the agular contribution of the 
%additional pole to alter our transient response.
K = tf([1 0.65],[1 0]);
rlocus(G*K)
%use same s-grid plot as before to see how the gain has changed with this
%new addition
sgrid(0.6,[0:5:10])
%new Kpi = 13.6. Create new closed-loop transfer function with these 
%characteristics to see how well PI controller works
Kpi = 10.9*K;
T_PI = feedback(Kpi*G, 1);
figure
step(T_PI)
stepinfo(T_PI)
