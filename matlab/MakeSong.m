load handel.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%NOTE FREQUENCES
rest = 0;
NOTE_B0=31;
NOTE_C1= 33;
NOTE_CS1=35;
NOTE_D1= 37;
NOTE_DS1=39;
NOTE_E1= 41;
NOTE_F1= 44;
NOTE_FS1=46;
NOTE_G1= 49;
NOTE_GS1 = 52;
NOTE_A1= 55;
NOTE_AS1=58;
NOTE_B1=62;
NOTE_C2 =65;
NOTE_CS2=69;
NOTE_D2= 73;
NOTE_DS2=78;
NOTE_E2 =82;
NOTE_F2 =87;
NOTE_FS2=93;
NOTE_G2= 98;
NOTE_GS2=104;
NOTE_A2= 110;
NOTE_AS2=117;
NOTE_B2= 123;
NOTE_C3= 131;
NOTE_CS3=139;
NOTE_D3= 147;
NOTE_DS3=156;
NOTE_E3=165;
NOTE_F3=175;
NOTE_FS3=185;
NOTE_G3=196;
NOTE_GS3=208;
NOTE_A3=220;
NOTE_AS3=233;
NOTE_B3=247;
NOTE_C4=262;
NOTE_CS4=277;
NOTE_D4=294;
NOTE_DS4=311;
NOTE_E4=330;
NOTE_F4=349;
NOTE_FS4=370;
NOTE_G4=392;
NOTE_GS4=415;
NOTE_A4=440;
NOTE_AS4=466;
NOTE_B4=494;
NOTE_C5=523;
NOTE_CS5=554;
NOTE_D5=587;
NOTE_DS5=622;
NOTE_E5=659;
NOTE_F5=698;
NOTE_FS5=740;
NOTE_G5=784;
NOTE_GS5=831;
NOTE_A5=880;
NOTE_AS5=932;
NOTE_B5=988;
NOTE_C6=1047;
NOTE_CS6=1109;
NOTE_D6=1175;
NOTE_DS6=1245;
NOTE_E6=1319;
NOTE_F6=1397;
NOTE_FS6=1480;
NOTE_G6=1568;
NOTE_GS6=1661;
NOTE_A6=1760;
NOTE_AS6=1865;
NOTE_B6=1976;
NOTE_C7=2093;
NOTE_CS7=2217;
NOTE_D7=2349;
NOTE_DS7=2489;
NOTE_E7=2637;
NOTE_F7 =2794;
NOTE_FS7=2960;
NOTE_G7 =3136;
NOTE_GS7=3322;
NOTE_A7 = 3520;
NOTE_AS7= 3729;
NOTE_B7 = 3951;
NOTE_C8 = 4186;
NOTE_CS8 = 4435;
NOTE_D8 = 4699;
NOTE_DS8=4978;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SWAN LAKE
melody = [NOTE_E4,rest, NOTE_A3, NOTE_B3, NOTE_C4, NOTE_D4,NOTE_E4,NOTE_E4,rest,NOTE_C4,NOTE_E4,NOTE_E4,rest,NOTE_C4,NOTE_E4,NOTE_E4,rest,NOTE_A3,...
NOTE_C4,NOTE_A3,NOTE_F3,NOTE_C4,NOTE_A3,NOTE_A3,NOTE_D4,NOTE_C4,NOTE_B3,NOTE_E4,rest,NOTE_A3,NOTE_B3,NOTE_C4,NOTE_D4,NOTE_E4,NOTE_E4,rest,NOTE_C4,...
NOTE_E4,NOTE_E4,rest,NOTE_C4,NOTE_E4,NOTE_E4,rest,NOTE_A3,NOTE_C4,NOTE_A3,NOTE_F3,NOTE_C4,NOTE_A3,rest,rest,NOTE_A3,NOTE_B3,NOTE_C4,NOTE_D4,NOTE_E4,NOTE_F4,...
NOTE_G4,NOTE_G4,rest,NOTE_F4,NOTE_E4,NOTE_F4,NOTE_G4,NOTE_A4,NOTE_A4,rest,NOTE_G4,NOTE_F4,NOTE_G4,NOTE_A4,NOTE_B4,NOTE_B4,rest,NOTE_A4,NOTE_GS4,NOTE_A3];%melody(i) is note frequency

dur = 1./[1,1,4,4,4,4,2,4,1,4,2,4,1,4,2,4,4,4,4,4,4,4,1,4,4,4,4,1,1,4,4,4,4,2,4,1,4,...
    2,4,1,4,2,4,4,4,4,4,4,4,1,2,1,2,2,2,2,4,4,...
    2,4,1,4,2,4,4,2,4,1,4,2,4,4,2,4,1,4,2,2]; %duration of note
%%%
%STAR WARS THEME
% melody = [NOTE_D3,NOTE_D3,NOTE_D3,NOTE_G3,NOTE_D4,NOTE_C4,NOTE_B3,NOTE_A3,NOTE_G4,NOTE_D4,...
%   NOTE_C4,NOTE_B3,NOTE_A3,NOTE_G4,NOTE_D4,NOTE_C4,NOTE_B3,NOTE_C4,NOTE_A3,rest,...
%   NOTE_D3,NOTE_D3,NOTE_D3,NOTE_G3,NOTE_D4,NOTE_C4,NOTE_B3,NOTE_A3,NOTE_G4,NOTE_D4,...
%   NOTE_C4,NOTE_B3,NOTE_A3,NOTE_G4,NOTE_D4,NOTE_C4,NOTE_B3,NOTE_C4,NOTE_A3,rest];
% dur = 1./[10,10,10,2,2,10,10,10,2,4,10,10,10,2,4,10,10,10,2,4,10,10,10,2,2,10,10,10,2,4,...
%     10,10,10,2,4,10,10,10,2,4];
%%%
fs = 1e4; % sampling frequency, over twice as high as highest possible frequency (4978)
song = [];
disp(length(song));
for i =1:length(melody)
  t = 1:1/fs:(1+dur(i));% time signal
  y = sin(2*pi*melody(i)*t);% create sine wave 
  %beatpause space between notes
  beatpause = 0; %for swanloake
  %beatpause = dur(i)*1.3;%for all other songs
  spacetimes = 1:1/fs:(1+beatpause); %duration of pause in between beats
  beatspace = sin(0*spacetimes);
%   song(i) = [song y];%%
  if(i==length(melody))     
    song= [song y];
  else
     song= [song y beatspace];
  end
end
player = audioplayer(song, fs);
play(player)% play the sound
%save file
filename = 'Tchaikovskywav_SwanLake.wav';
audiowrite(filename,song,fs);
clear y Fs
disp("DONE");