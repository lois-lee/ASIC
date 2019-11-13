% initialize state field
sta = [];
par = [];


FixP_out = {0,23,'s'}; % {I,F,'s'} where 's' is signed 
QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate     
    
par.INP.tune.name = 'EXA'; % set example tune

% initialize all default parameters and state variables
[par,sta] = GLO_init(par,sta);
[par,sta] = INP_init(par,sta);
[par,sta] = NYQ_init(par,sta);

stimuli = [];
response = [];

for tt=1:1000
    % sta.AMP.Out_DO = (tt>=100)*0.9; %%% STEP TEST
    % sta.AMP.Out_DO = (tt==101)*.9; %%% IMPULSE TEST
    sta.AMP.Out_DO = 2*rand(1)-1; %%% RANDOM TEST
    
    % real resize this amp output
    RealRESIZE(sta.AMP.Out_DO, FixP_out,QType_out);
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
outputs = [];
bitshift = 23;

% inputs
for i=1:length(stimuli)
    inputs(i) = floor(stimuli(i) .* (2^bitshift));
end

% outputs
for i=1:length(response)
    if (response(i,2)~= 0)
        for j= 1:sta.GLO.OSR_DO 
            outputs = [outputs,floor(response(i,1) .* (2^bitshift))];
        end
    end
end

% coefficients
for i=1:length(sta.NYQ.coeff)
    coeff(i) = floor(sta.NYQ.coeff(i) .* (2^bitshift));
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

% load in param coeffs
formatSpec_coeff = '1 1 %d %d 0 \n';
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,formatSpec_coeff, c(i), coeff(i));
end

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

% flush
fprintf(fileID,'x \n');
fprintf(fileID,'x \n');

% while we load in coeff, return x
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,'x \n');
end

% outputs
formatSpec_output = '%d \n';
fprintf(fileID, formatSpec_output, outputs);

% close input file
fclose(fileID);



