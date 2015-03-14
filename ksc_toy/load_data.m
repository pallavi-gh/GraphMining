function [ keylist, X ] = load_data( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid=fopen(filename);
n = 0;
tline = fgetl(fid);
while ischar(tline)
  tline = fgetl(fid);
  n = n+1;
end
X=[];
keylist=[];
fidn=fopen(filename);
for i=1:n
        if i==n/2
            disp('ended');
            break;
        end
        sline=fgetl(fidn);
        arr=strsplit(sline,'\t');
        keyi=char(arr{2});
%         keyf=strsplit(keyi,'#');
%         disp(keyi);
%         temp=keyf{2};
%         first=char(temp);
        keylist=strvcat(keylist,keyi);
        rline=fgetl(fidn);
        a = str2num(rline);
        if length(a)>0
            X = [X;a];
        end
end
fclose(fid);
fclose(fidn);


