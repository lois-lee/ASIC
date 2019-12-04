
bits = 23;

% ADDED PART TO WRITE INTO FILES

% get the coeff matrix bitshifted
coeff = zeros(1, length(sta.NYQ.coeff));
inputs = zeros(1, length(sta.NYQ.ins));
outputs = zeros(1, length(sta.NYQ.outs));


% inputs
for i=1:length(sta.NYQ.ins)
    inputs(i) =(sta.NYQ.ins(i) .* (2^bits));
end

% outputs
for i=1:length(sta.NYQ.outs)
    outputs(i)= (sta.NYQ.outs(i) .* (2^bits));
%     if response(i,1)> 0
%      disp(response(i,1));
%     end
end

% coefficients
for i=1:length(sta.NYQ.coeff)
%     coeff(i) = floor(sta.NYQ.coeff(i) .* (2^bitshift));
    coeff(i) = (sta.NYQ.coeff(i).* (2^bits));
end

% for the number of coeffs
c = zeros(length(sta.NYQ.coeff));
for i=1:length(sta.NYQ.coeff)
    c(i) = i-1;
end

% =========================================================================
% ==============             INPUT FILE              ====================== 
% =========================================================================

% open input file
fileID = fopen('NYQ_in.txt','w');

% Format :
% Rst_RB, WrEn_S, Addr_D, PAR_In_D, NYQ_In_DI

% flush
fprintf(fileID,'1 0 0 0 0 \n');
fprintf(fileID,'0 0 0 0 0 \n');
fprintf(fileID,'1 0 0 0 0 \n');

% load in param coeffs
formatSpec_coeff = '1 1 %d %d 0 \n';
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,formatSpec_coeff, c(i), coeff(i));
end

fprintf(fileID,'1 1 32 1 0 \n');

% load in inputs
formatSpec_input = '1 0 0 0 %d \n';
fprintf(fileID,formatSpec_input, inputs);

% close input file
fclose(fileID);



% =========================================================================
% ==============            OUTPUT FILE              ====================== 
% =========================================================================

% open output file
fileID = fopen('NYQ_out.txt','w');

% Format :
% Output

% latency because of ff before output 
fprintf(fileID,'x \n');

% flush
fprintf(fileID,'x \n');
fprintf(fileID,'x \n');
fprintf(fileID,'x \n');


% while we load in coeff, return x
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,'x \n');
end

% for the after the coeff loading flag
fprintf(fileID,'x \n');

% outputs
formatSpec_output = '%d \n';
fprintf(fileID, formatSpec_output, outputs);

% close input file
fclose(fileID);


