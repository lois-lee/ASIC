% =========================================================================
% ECE 5746 - This block models inputs to the synthesizer (INITIALIZATION)
% (c) 2019 studer@cornell.edu
% =========================================================================

function [par,sta] = INP_init(par,sta)

% INP states 
sta.INP.Key_DO = 0;  % key pressed? (0=no, 1=yes)
sta.INP.Freq_DO = 0; % frequency of pressed key [Hz]
sta.INP.Vol_DO = 0;  % volume of pressed key [0,1] (where 1 is loud!)

% all state variables used by this block must be initialized
sta.INP.time = 0;
sta.INP.note_index = 1;

end