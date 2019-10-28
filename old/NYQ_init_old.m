% =========================================================================
% ECE 5746 - Simple Sawtooth Wave Oscillator Model
% (c) 2019 ok93@cornell.edu, ut33@cornell.edu, ll556@cornell.edu
% ===================================================================
function [sta] = NYQ_init(par,sta)

% all state variables used by this block must be initialized
% • Quantize all block input parameters to 32-bit; you can decide on the number format
% of each parameter. Note that if you have multiple modes, then you can encode
% multiple modes onto one 32-bit number


FixP_out = {2,30,'s'}; % {I,F,'s'} where 's' is signed
QType_out = 'WrpTrc'; % we wrap and truncate

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             FILTER COEFFICIENTS                     % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% length 16 coeff array:
% x = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1]; %filter coefficents

% length 24 coeff array:
% x = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5,0.6,0.7,0.8,0.9,0.9,0.8,0.7,0.6,0.5,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; %filter coefficents

% length 32 coeff array:
x = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55, 0.6,0.65, 0.7,0.75, 0.8,0.9,0.9,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.45,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; %filter coefficents


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             QUANTIZE 32                             % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

for y = 1:length(x)
    sta.NYQ.coeff(y) = RealRESIZE(x(y), FixP_out,QType_out);
end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             ORIGINAL STATE                          % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
sta.NYQ.cnt = 0; % set counter to zero
sta.NYQ.old_output = 0; % old output
sta.NYQ.new_output = 0; %new input
sta.NYQ.past = zeros(length(sta.NYQ.coeff),1);% past inputs buffer


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             RESIZE STATE                            % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% resize using RealRESIZE
sta.NYQ.cnt = RealRESIZE(sta.NYQ.cnt , FixP_out,QType_out);
sta.NYQ.old_output = RealRESIZE(sta.NYQ.old_output, FixP_out,QType_out);
sta.NYQ.new_output = RealRESIZE(sta.NYQ.new_output , FixP_out,QType_out);
sta.NYQ.past = RealRESIZE(sta.NYQ.past, FixP_out,QType_out);
end
