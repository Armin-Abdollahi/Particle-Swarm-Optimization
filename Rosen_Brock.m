function cost = Rosen_Brock(x)

cost=0;

for i=1:length(x)-1

    cost = cost + (100*(x(i+1)-x(i)^2)^2 + (1-x(i))^2);

end

end