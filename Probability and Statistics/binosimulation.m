%simulate binomial distr
%binomial distribution is the sum of n independent bern distributions
n = input('nr of trials = ');
p = input('p(in (0,1) = ');

%generate a sample
N = input('Nr. of simulations = ');

for i = 1:N
   U = rand(n,1);
   X(i) = sum(U < p);
end

%compare graphically to binomial distributions

UX = unique(X); %only distinct

nX = hist(X, length(UX)); %sequences

relfr = nX/N;

%true Bino(n,p)

k = 0:n;

pk = binopdf(k, n, p);

plot(UX, relfr, '*', k, pk, 'o', 'Markersize', 10);
legend('Sim.     ','Binomial', 'Location', 'best');