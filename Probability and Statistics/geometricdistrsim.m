p = input('p(in (0,1) = ');

%generate a sample
N = input('Nr. of simulations = ');

for i = 1:N
   
    X(i) = 0;
    while rand >= p %count nr of failures
    X(i) = X(i) + 1;
    end
end

UX = unique(X); %only distinct

nX = hist(X, length(UX)); %sequences

relfr = nX/N;

%true geopdf(n,p)

k = 0:20;

pk = geopdf(k, p);

plot(UX, relfr, '*', k, pk, 'o', 'Markersize', 10);
legend('Sim.     ','Binomial', 'Location', 'best');