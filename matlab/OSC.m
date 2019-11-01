% =========================================================================
% ECE 5746 - Simple Sawtooth Wave Oscillator Model
% (c) 2019 ok93@cornell.edu, ut33@cornell.edu, ll556@cornell.edu
% =========================================================================

function [sta,out] = OSC(par,sta,in)

% compute increment (oscillator does not reset at keystroke)
sta.OSC.inc = par.INP.freq/par.GLO.fs_i;

% increment position within one period of the sawtooth
sta.OSC.pos = sta.OSC.pos + sta.OSC.inc;

% reset position if period exceeded
if sta.OSC.pos>1
    sta.OSC.pos = sta.OSC.pos - 1;
end

% compute sawtooth function
out = 2*(mod(sta.OSC.pos,1) - 0.5);

end