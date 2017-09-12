M = [20 40 80 160];
j = 1;
errorCNS = zeros(1,2);
%errorFTCS = zeros(1,5);
for i=M
    errorCNS(j) = cnscheme2(i);
    %errorFTCS(j) = labsheet2_1_FTCS(i);
    j = j+1;
end
for k = 1:(size(M,2)-1)
    OrderCNS = log(errorCNS(k)/errorCNS(k+1))/log(2)
%OrderFTCS = log(errorFTCS(1)/errorFTCS(2))/log(2)
end