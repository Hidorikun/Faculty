n = input('Number of trials.');
p = input('Prob. of success.');
x = 0:n;
xx = 0:0.01:n;
fpdf = binopdf(x, n, p);
fcdf = binocdf(xx, n, p);
clf
subplot(2,1,1);
plot(x, fpdf, 'r*')
subplot(2,1,2);
plot(xx, fcdf, '*')