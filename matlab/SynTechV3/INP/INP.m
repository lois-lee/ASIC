% =========================================================================
% ECE 5746 - This block models inputs to the synthesizer
% (c) 2019 studer@cornell.edu
% =========================================================================

function sta = INP(par,sta)

% generate frequencies of notes contained in the vector frequency_list
% index : 1  2   3  4   5  6  7   8  9   10 11  12 
% note  : C4 C#4 D4 D#4 E4 F4 F#4 G4 G#4 A4 A#4 B4 
% index : 13 14  15 16  17 18 19  20 21  22 23  24
% note  : C5 C#5 D5 D#5 E5 F5 F#5 G5 G#5 A5 A#5 B5
nn = 40:64;
frequency_list = 2.^((nn-49)/12)*440;
% full list of frequencies here: https://en.wikipedia.org/wiki/Piano_key_frequencies

% define notes to be played
note = [ 5 3 1 3 5 5 5 3 3 3 5 8 8 5 3 1 3 5 5 5 3 3 5 3 1 1 ];
ampl = [ 1 0.8 0.8 0.8 0.8 0.8 1 0.9 0.8 0.7 0.8 0.9 1 1 0.9 0.8 0.9 0.9 0.9 1 0.9 0.9 0.9 0.8 0.7 0 ];
rele = [ 1 1 1 1 1 1 3 1 1 2 1 1 3 1 1 1 1 1 1 3 1 1 1 1 2 1 ]/16;
secs = [ 1 1 1 1 1 1 2 1 1 2 1 1 2 1 1 1 1 1 1 2 1 1 1 1 2 1 ]/8;

% NYQ filter's tune
% note = [ 5 3 1 3 5 6 5 5 3 1 3 5 6 3 3 1 3 5 3 5 6 8 5];
% ampl = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
% rele = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]/16;
% secs = [ 1 1 1 1 1 1 4 1 1 1 1 1 1 4 1 2 1 1 2 1 2 1 4]/8;


% measure time that elapsed
sta.INP.time = sta.INP.time + 1/par.GLO.FSInt_DI;

% check when to press key and when to release
if sta.INP.time<rele(sta.INP.note_index)
    sta.INP.Key_DO = 1; % press key
    sta.INP.Freq_DO = frequency_list(note(sta.INP.note_index)); % set frequency
    sta.INP.Vol_DO = ampl(sta.INP.note_index); % set amplitude
else
    sta.INP.Key_DO = 0; % release
end

% check which note should be played
if sta.INP.time>secs(sta.INP.note_index)
    sta.INP.time = 0; % reset time state
    sta.INP.note_index = sta.INP.note_index + 1; % proceed to next note
    if sta.INP.note_index>length(note)
        sta.INP.note_index = length(note); % stay at last note
    end
end
                
end



