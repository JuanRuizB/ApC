function pintarNube2D(X,Y)
A = [X;Y];
for i = 1:3

    plot(A(1,A(3,:)==i),A(2,A(3,:)==i),'*');hold on;

end
end