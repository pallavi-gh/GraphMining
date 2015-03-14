function listkeywords
fid=fopen('TwtHtag.txt');
n = 0;
tline = fgetl(fid);
while ischar(tline)
  tline = fgetl(fid);
  n = n+1;
end
keylist=[];
fidn=fopen('TwtHtag.txt');
for i=1:n
        if i==1000
            disp('ended');
            break;
        end
        sline=fgetl(fidn);
        arr=strsplit(sline,'\t');
        keyi=char(arr{2});
        keyf=strsplit(keyi,'#');
        temp=keyf{2};
        first=char(temp);
        keylist=strvcat(keylist,first);
        rline=fgetl(fidn);
end
save('listkeywordsnew.mat');
fclose(fid);
