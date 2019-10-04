% =========================================================================
% ECE 5746 - Simple Nyquist Filter Model
% (c) 2019 ok93@cornell.edu, ut33@cornell.edu, ll556@cornell.edu
% ===================================================================
function [sta,out] = NYQ(par,sta,in)

% add most recent input to buffer
sta.NYQ.past = [in; sta.NYQ.past];    

%clip the last value in buffer when it gets full.
if length(sta.NYQ.past) > length(sta.NYQ.coeff)
    sta.NYQ.past(end) = [];
end

n = length(sta.NYQ.coeff)/par.GLO.osr;

for i = 1:n
    a = sta.NYQ.coeff(i) * sta.NYQ.past(i);
    sta.NYQ.new_output = sta.NYQ.new_output + a;
end

%increment count
sta.NYQ.cnt = sta.NYQ.cnt + 1;

%only output every Kth value where K is the oversampling ratio
if sta.NYQ.cnt>=par.GLO.osr
    sta.NYQ.cnt = 0;
    % output filtered sample
    sta.NYQ.old_output = sta.NYQ.new_output;
    %clear new output
    sta.NYQ.new_output = 0;
end

out = sta.NYQ.old_output;

end