function x = propagacion(W,y,b)
% n =size(y,2);
% for i = 1:size(y,1)
%     y(i,n+1) = b;
% end
x = y*W+b;
end