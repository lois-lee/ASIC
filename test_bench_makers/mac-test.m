
% to do:
% realresize stuff
% make sure of the other signals

FixP_out = {0,23,'s'}; % {I,F,'s'} where 's' is signed 
QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate     

Out_DO_lst = [];
bitshift = 23;
product_D; 
sum_D;
accumulate_D;


% INPUTS:
% Rst_RB, Clr_SI, WrEn_SI,In0_DI,In1_DI

% OUTPUTS:
% Out_DO


fileID = fopen('MAC_out.txt','w');
for tt=1:1000

    for i = 1:sta.GLO.OSR_DO-1
        In0_DI = rand(1);
        In1_DI = rand(1);
        
        formatSpec_input = '1 0 0 %d %d \n';
        fprintf(fileID,formatSpec_input, In0_DI.* (2^bitshift),...
            In1_DI.* (2^bitshift));
        
        product_D = RealMULT(In0_DI, In1_DI, FixP_out, QType_out);
        sum_D = RealADD(product_D, accumulate_D, FixP_out, QType_out);
        Out_DO_lst = [Out_DO_lst, sum_D .* (2^bitshift)];
    end
    In0_DI = rand(1);
    In1_DI = rand(1);
    
    formatSpec_input = '1 0 0 %d %d \n';
    fprintf(fileID,formatSpec_input, In0_DI.* (2^bitshift), ...
        In1_DI.* (2^bitshift));
    
    product_D = RealMULT(In0_DI, In1_DI, FixP_out, QType_out);
    sum_D = RealADD(product_D, accumulate_D, FixP_out, QType_out);
    Out_DO_lst = [Out_DO_lst, sum_D .* (2^bitshift)];
    
    accumulate_D = 0;
    
end
fclose(fileID);

% open txt file for mac test
fileID = fopen('MAC_out.txt','w');

% outputs
formatSpec_output = '%d \n';
fprintf(fileID, formatSpec_output, Out_DO_lst);

% close input file
fclose(fileID);
