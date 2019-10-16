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
QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             FILTER COEFFICIENTS                     % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% length 16 coeff array:
 x_D = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1]; %filter coefficents

% length 24 coeff array:
% x_D = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5,0.6,0.7,0.8,0.9,0.9,0.8,0.7,0.6,0.5,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; %filter coefficents

% length 32 coeff array:
%x_D = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55, 0.6,0.65, 0.7,0.75, 0.8,0.9,0.9,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.45,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; %filter coefficents


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             QUANTIZE 32                             % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

for y = 1:length(x_D)
    sta.NYQ.coeff(y) = RealRESIZE(x_D(y), FixP_out,QType_out);
end

sta.NYQ.a_D = 0;
sta.NYQ.b_D = 0;
sta.NYQ.temp_D = 0;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             ORIGINAL STATE                          % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
sta.NYQ.cnt_D = 0; % set counter to zero
sta.NYQ.output_DP = 0; % old output

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % %             RESIZE STATE                            % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% resize using RealRESIZE
%sta.NYQ.cnt_D = RealRESIZE(sta.NYQ.cnt_D, FixP_out,QType_out);
%sta.NYQ.output_DP = RealRESIZE(sta.NYQ.output_DP, FixP_out,QType_out);
end
