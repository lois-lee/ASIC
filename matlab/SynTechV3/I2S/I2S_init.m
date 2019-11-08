% =========================================================================
% ECE 5746 - Simple I2S Model (INITIALIZATION)
% (c) 2019 studer@cornell.edu
% =========================================================================

function [par,sta] = I2S_init(par,sta)

% set I2S parameters

% all state variables used by this block must be initialized

% ---------------  output variables for I2S ---------------- %
sta.I2S.SCK_DO = dec2bin(0,24);                % output of SCK
sta.I2S.WS_DO = dec2bin(0,24);                 % output of WS
sta.I2S.SDA_DO = dec2bin(0,24);                % SDA output

% ------------  external state variables for I2S ------------- %
sta.I2S.Valid_DI = dec2bin(0,32);              % input signal to start the SCK

% ------------  global state variables for I2S ------------- %
sta.I2S.DW_DI = 24;
sta.I2S.Freq_D = (sta.GLO.FSOut_DO/sta.GLO.OSR_DO)*2*sta.I2S.DW_DI*1; 
% frequency of the SCK for I2S Block
% Freq_D = 48000 * 2 * 24 * 1 = 2304000, T_SCK = 4.34027778e-7



% ----------------  state variables for SCK ---------------- %
sta.I2S.SCK_S = dec2bin(0,1);                 % SCK clock status
sta.I2S.SCKcnt_S = dec2bin(0,32);              % counter for SCK
sta.I2S.SCKt_S = (sta.GLO.FSOut_DO/(sta.I2S.Freq_D*2));
sta.I2S.SCKt_S = dec2bin(sta.I2S.SCKt_S, 32);
 
% ------------- state variables for Word Select ------------- %
% sta.I2S.WSValid_S = dec2bin(0,32);             % variable indicating when to start sending data 
sta.I2S.WS_S = dec2bin(0,1);                  % Word Select Status
sta.I2S.WScnt_S = dec2bin(0,5);               % counter for WS
sta.I2S.WSt_S = dec2bin(sta.I2S.DW_DI,5);     % threshold value for WS counter
 
% -------------- state variables for SDA data --------------- %
sta.I2S.SDAcnt_S = dec2bin(sta.I2S.DW_DI,5);
% counter indicating which bit of data is outputted to SDA_DO 
% initialized to be data bitwidth - 1 for the one cycle delay of SDA
sta.I2S.SDA_DI = dec2bin(0, sta.I2S.DW_DI); % SDA values in bits  
sta.I2S.SDA_init_S = 0;

end