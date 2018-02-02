%Simulate 3 coin tosses
N = input('Nr. of simulations = ');
U = rand(3,N);
Y = (U < 0.5);
X = sum(Y);
hist(X);