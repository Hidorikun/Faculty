%Simuate Bern(p) distr

p = input('p(in(0,1)) = ');


%Standard uniform variable U
U = rand;
X = (U < p);
%generate a sample
N = input('Nr. of simulations = ');

for i = 1:N
   U = rand;
   X(i) = (U < p);
end



%compare to Bern(p) dists
UX = unique(X) %only distinct

nX = hist(X, length(UX)) %sequences

relfr = nX/N
