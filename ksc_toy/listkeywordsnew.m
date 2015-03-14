function listkeywordsnew
fid=fopen('final.txt');
n = 0;
tline = fgetl(fid);
while ischar(tline)
  tline = fgetl(fid);
  n = n+1;
end
n
keylist=[];
fidn=fopen('final.txt');
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
end
save('listkeywordsnew.mat');
fclose(fid);
