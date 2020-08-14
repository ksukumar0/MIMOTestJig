addpath('../TDMSReader/v2p5');

enb.NDLRB = 100;
enb.NCellID = 0;
enb.NSubframe = 0;
enb.CellRefP = 2;
enb.CyclicPrefix = 'Normal';
enb.DuplexMode = 'FDD';

crs0PerFrame = zeros(200,10);
crs1PerFrame = zeros(200,10);

for i=0:9

    enb.NSubframe = i;
    sym = lteCellRS(enb);
    ind = lteCellRSIndices(enb);
    griddl = lteResourceGrid(enb);
    griddl(ind) = sym;
%   we only want the 200 CRS values on Symbol 0 and skip the rest
    ind1 = ind(1:200);
    ind2 = ind((size(ind,1))/2+1:(size(ind,1))/2 + 200);
    
    a = abs(griddl(:,:,1));
    b = abs(griddl(:,:,2));
    crs0 = griddl(ind1);
    crs1 = griddl(ind2);
    
    crs0PerFrame(:,i+1) = crs0;
    crs1PerFrame(:,i+1) = crs1;

end    

filename = 'C:\Users\ge69mog\Downloads\test.tdms';
str = TDMS_getStruct(filename);

H11 = str.RxCRSData.H11_Amp.data.*exp(j*str.RxCRSData.H11_Phase.data);
H22 = str.RxCRSData.H22_Amplitude.data.*exp(j*str.RxCRSData.H22_Phase.data);
SubFrameIndex = uint8(str.RxCRSData.Subframe_Index_0.data);

H11 = reshape(H11,200,[]);
H22 = reshape(H22,200,[]);
SubFrameIndex = reshape(SubFrameIndex, 200, []);

x1 = crs0PerFrame(:,SubFrameIndex(1,:)+1);
x2 = crs1PerFrame(:,SubFrameIndex(1,:)+1);

y1 = H11;
y2 = H22;

save example.mat x1 x2 y1 y2 -v7.3;
% imagesc((1:14),(1:1200),b);
% colormap(gray); 
% surf(a,b);
