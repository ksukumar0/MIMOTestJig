
fileID = fopen('magic4.bin','w');
fwrite(fileID,magic(4),'double');
fclose(fileID);