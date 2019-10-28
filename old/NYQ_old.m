% =========================================================================
% ECE 5746 - Simple Nyquist Filter Model
% (c) 2019 ok93@cornell.edu, ut33@cornell.edu, ll556@cornell.edu
% ===================================================================
function [sta,out] = NYQ(par,sta,in)


% Convert the key signal and parameter representations of your block in fixed-point
% format. Quantize the sample inputs and outputs (if applicable) to 24-bit fixed-point
% with format {0,23,’s’}, which enables us to cover a range [−1, 1); 24-bit is a common
% standard for high-end audio equipment and we will be using this for each block that
% processes samples

% https://www.mathworks.com/help/fixedpoint/ref/embedded.fi.html#mw_7c8c4a58-2771-41b7-8652-be2bffec20f2
% in = fi(in, 1, 24, 23);


FixP_out = {0,23,'s'}; % {I,F,'s'} where 's' is signed
QType_out = 'WrpTrc'; % we wrap and truncate

in = RealRESIZE(in, FixP_out, QType_out);

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

out = RealRESIZE(sta.NYQ.old_output, FixP_out, QType_out);

end
