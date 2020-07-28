% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

function [TimeDomain FrequencyDomain Time] = DataGeneratorFunction(Choice,Duration,SamplingFrequency,Parameters)

switch Choice

    case 1 
      Time = 0:SamplingFrequency:Duration;
      TimeDomain = Parameters(1)*cos(2*pi*(Parameters(2))*Time+((Parameters(3)*pi/180)));
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 2 
      Time = 0:SamplingFrequency:Duration;
      Filter=zeros(1,length(Time));
      Filter(Parameters(4)*(1/SamplingFrequency):(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=1;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      TimeDomain=temp.*Filter;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 3 
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=gausswin(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 4 
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=hamming(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;  	  
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 5 
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=tukeywin(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 6
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=kaiser(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
       case 7
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=chebwin(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    case 8
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=triang(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain))); 
    case 9
      Time=0:SamplingFrequency:Duration;
      temp=Parameters(1)*cos(2.*pi.*Parameters(2)*Time + Parameters(3)*pi/180);
      Filter=taylorwin(Parameters(5)*(1/SamplingFrequency));
      Filter2=zeros(1,length(Time));
      Filter2(Parameters(4)*(1/SamplingFrequency)+1:(Parameters(4)+Parameters(5))*(1/SamplingFrequency))=Filter;
      TimeDomain=temp.*Filter2;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain))); 
    case 10
      Time=0:SamplingFrequency:Duration;
      Filter=zeros(1,length(Time));
      Filter(SamplingFrequency*(1/SamplingFrequency)+1:(Parameters(5)+Parameters(6))*(1/SamplingFrequency)+1)=1;
      temp=chirp(Time,Parameters(2),Duration,Parameters(2)+Parameters(3));
      TimeDomain=temp.*Filter;
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain))); 
    case 11
      Time=0:SamplingFrequency:Duration;
      TimeDomain = Parameters(1)*square(2*pi*Parameters(2)*Time + Parameters(3)*pi/180 ,Parameters(4));
      FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain))); 
    case 12
       Time=0:SamplingFrequency:Duration;
       TimeDomain =  Parameters(1)*sawtooth(2*pi*Parameters(2)*Time + Parameters(3)*pi/180 , Parameters(4));
       FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain))); 
    case 13 
        Time = 0:SamplingFrequency:Duration;
        TimeDomain = 0;
        i = 1;
        while Parameters(1) > 0
          temp= Parameters(i+1)*cos(2*pi*(Parameters(i+2))*Time+((Parameters(i+3))*pi/180));
          TimeDomain = temp +  TimeDomain;     
          Parameters(1) = Parameters(1) - 1;
          i = i+3;
        end
          FrequencyDomain = abs(fft(TimeDomain,length(TimeDomain)));
    otherwise
      TimeDomain = 0;  
  	  FrequencyDomain = 0;      
end 
end

% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured
