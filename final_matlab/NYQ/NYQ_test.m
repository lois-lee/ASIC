% initialize state field
sta = [];
par = [];

addpath RealArith
format long

FixP_out = {0,23,'s'}; % {I,F,'s'} where 's' is signed 
QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate     
bits = 23;
    
par.INP.tune.name = 'EXA'; % set example tune

% initialize all default parameters and state variables
[par,sta] = GLO_init(par,sta);
[par,sta] = INP_init(par,sta);
[par,sta] = NYQ_init(par,sta);

stimuli = [];
response = [];

for tt=1:1000
    % sta.AMP.Out_DO = (tt>=100)*0.9;       %%% STEP TEST
    % sta.AMP.Out_DO = (tt==101)*.9;        %%% IMPULSE TEST
    sta.AMP.Out_DO = 2*rand(1)-1;         %%% RANDOM TEST
	% sta.AMP.Out_DO = sawtooth(tt);        %%% SAWTOOTH TEST
    % real resize this amp output
    sta.AMP.Out_DO =  RealRESIZE(sta.AMP.Out_DO, FixP_out,QType_out);
    stimuli(tt,1) = sta.AMP.Out_DO;
    sta = NYQ(par,sta);
    response(tt,:) = [ sta.NYQ.Out_DO , sta.NYQ.Valid_DO ];
end

figure(1)
plot(response(:,1).*response(:,2),'b--')
hold on
%plot(conv(sta.NYQ.coeff,stimuli),'r-')
reference = filter(sta.NYQ.coeff,1,stimuli);
cropped = reference(6:end);
plot(cropped,'r-')

%plot(stimuli,'g:');
hold off
grid on


% ADDED PART TO WRITE INTO FILES

% get the coeff matrix bitshifted
coeff = zeros(1, length(sta.NYQ.coeff));
inputs = zeros(1, tt);
outputs = zeros(1, tt);


% inputs
for i=1:length(stimuli)
    inputs(i) =(stimuli(i) .* (2^bits));
end

% outputs
for i=1:length(response)
    outputs(i)= (response(i,1) .* (2^bits));
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


