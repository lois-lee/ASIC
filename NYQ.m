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
QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate

sta.NYQ.a_D = sta.NYQ.a_D + sta.NYQ.coeff(sta.NYQ.cnt_D + 1) * in;

sta.NYQ.b_D = sta.NYQ.b_D + sta.NYQ.coeff(par.GLO.osr + sta.NYQ.cnt_D + 1) * in;

%increment count
sta.NYQ.cnt_D = sta.NYQ.cnt_D + 1;

%only output every Kth value where K is the oversampling ratio
if sta.NYQ.cnt_D>=par.GLO.osr
    sta.NYQ.cnt_D = 0;
    % output filtered sample
    sta.NYQ.output_DP = sta.NYQ.a_D + sta.NYQ.temp_D;
    %clear MAC flip flops
    sta.NYQ.temp_D = sta.NYQ.b_D;
    sta.NYQ.a_D = 0;
    sta.NYQ.b_D = 0;
end

out = sta.NYQ.output_DP;

end
