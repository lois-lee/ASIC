% =========================================================================
% ECE 5746 - Cycle-True MATLAB Model for SynTech V4
% (c) 2019 studer@cornell.edu
% =========================================================================
function SynTech(varargin) 

close all hidden % to close simulation wait bar(s)

addpath RealARITH
addpath Output
addpath GLO
addpath INP
addpath LFO
addpath OSC
addpath FLT
addpath ENV
addpath AMP
addpath NYQ
addpath I2S

%% ------------------------------------------------------------------------

% initialize state field
sta = [];
par = [];

% set default parameters
if nargin==0
    par.INP.tune.name = 'EXA'; % set example tune
    i2s_on = false; % 'true' or 'false' 
elseif nargin==1
    par.INP.tune.name = varargin{1}; % first argument is tune name    
    i2s_on = false; % 'true' or 'false'     
else
    par.INP.tune.name = varargin{1}; % first argument is tune name   
    i2s_on = varargin{2};
end

% initialize all default parameters and state variables
[par,sta] = GLO_init(par,sta);
[par,sta] = INP_init(par,sta);
[par,sta] = LFO_init(par,sta);
[par,sta] = OSC_init(par,sta);
[par,sta] = FLT_init(par,sta);
[par,sta] = ENV_init(par,sta);
[par,sta] = AMP_init(par,sta);
[par,sta] = NYQ_init(par,sta);
[par,sta] = I2S_init(par,sta);

%% ------------------------------------------------------------------------

% set up basic simulation parameters
sim.time = .1; % simulate for 1 second
sim.samples = sim.time*par.GLO.FSInt_DI; % total number of samples
sim.name = ['test_' par.INP.tune.name]; % used as filename

% allocate memory for output waveforms
wav.i = zeros(1,sim.samples);
wav.o = zeros(1,ceil(sim.samples/sta.GLO.OSR_DO));

%% ------------------------------------------------------------------------

% setting up simulation progress bar
tic;
last_time = toc;
f = waitbar(0,'Simulation running...');

% simulate synthesizer for sim.samples cycles
cycle_o = 0;
for cycle=1:sim.samples
    
    % update simulation progress bar every 2 seconds
    if last_time+2<toc
        last_time = toc;
        waitbar(cycle/sim.samples,f)
    end
    
    % ---------------------------------------------------------------------
    % Model SynTech functionality
    % ---------------------------------------------------------------------
    
    sta = GLO(par,sta); % GLO model
    sta = INP(par,sta); % INP model
    sta = LFO(par,sta); % LFO model
    sta = OSC(par,sta); % OSC model
    sta = FLT(par,sta); % FLT model
    sta = ENV(par,sta); % ENV model
    sta = AMP(par,sta); % AMP model
    sta = NYQ(par,sta); % NYQ model
    if i2s_on % only simulate if output required
        sta = I2S(par,sta); % I2S model
    end
    
    % ---------------------------------------------------------------------
    
    % record outputs
    wav.i(cycle) = sta.AMP.Out_DO; % read from AMP output state
    if sta.NYQ.Valid_DO==1 % only read sample from NYQ if it is new
        cycle_o = cycle_o + 1;
        wav.o(cycle_o) = sta.NYQ.Out_DO; % read from NYQ output state
    end
    
end

% close simulation wait bar and display total simulation time
close(f)
toc




% ADDED PART TO WRITE INTO FILES
bits = 23;

% get the coeff matrix bitshifted
coeff = zeros(1, length(sta.NYQ.coeff));
inputs = zeros(1, length(sta.NYQ.ins));
outputs = zeros(1, length(sta.NYQ.outs));


% inputs
for i=1:length(sta.NYQ.ins)
    inputs(i) =(sta.NYQ.ins(i) .* (2^bits));
end
% 
% outputs
for i=1:length(sta.NYQ.outs)
    outputs(i)= (sta.NYQ.outs(i) .* (2^bits));
%     if response(i,1)> 0
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

% % =========================================================================
% % ==============             INPUT FILE              ====================== 
% % =========================================================================

% open input file
fileID = fopen('NYQ_in.txt','w');

% Format :
% Rst_RB, WrEn_S, Addr_D, PAR_In_D, NYQ_In_DI

% flush
fprintf(fileID,'1 0 0 0 0 \n');
fprintf(fileID,'0 0 0 0 0 \n');
fprintf(fileID,'1 0 0 0 0 \n');
% 
% load in param coeffs
formatSpec_coeff = '1 1 %d %d 0 \n';
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,formatSpec_coeff, c(i), coeff(i));
end
 
fprintf(fileID,'1 1 32 1 0 \n');
% 
% load in inputs
formatSpec_input = '1 0 0 0 %d \n';
fprintf(fileID,formatSpec_input, inputs);
 
% close input file
fclose(fileID);
 
 
%
% =========================================================================
% % ==============            OUTPUT FILE              ====================== 
% % =========================================================================
% 
% open output file
fileID = fopen('NYQ_out.txt','w');
% 
% % Format :
% % Output
% 
% % latency because of ff before output 
fprintf(fileID,'x \n');
% 
% flush
fprintf(fileID,'x \n');
fprintf(fileID,'x \n');
fprintf(fileID,'x \n');
% 
% 
% while we load in coeff, return x
for i=1:length(sta.NYQ.coeff)
    fprintf(fileID,'x \n');
end
% 
% % for the after the coeff loading flag
fprintf(fileID,'x \n');
% 
% outputs
formatSpec_output = '%d \n';
fprintf(fileID, formatSpec_output, outputs);
 
% close output file
fclose(fileID);




%% ------------------------------------------------------------------------

% save subsampled audio file
audiowrite(['Output/' sim.name '.wav'],wav.o,par.GLO.FSOut_DI);

% plot output waveform (at internal sampling rate)
figure(1)
t = linspace(0,sim.time,length(wav.i));
plot(t,wav.i)
grid on
xlabel('time [s]');
ylabel('amplitude');
axis([ 0 sim.time -1.1 +1.1])

% plot output waveform (at output sampling rate)
figure(2)
t = linspace(0,sim.time,length(wav.o));
plot(t,wav.o)
grid on
xlabel('time [s]');
ylabel('amplitude');
axis([ 0 sim.time -1.1 +1.1])

%% ------------------------------------------------------------------------

% done and beep!
beep

end