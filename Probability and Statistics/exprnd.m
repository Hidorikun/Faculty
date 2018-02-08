%Parameters
lmd = input('lambda = ');
N = input('sample size = ');
x = exprnd(lmd,1,N); %sample


n = 1 + (10/3)*log(N);

%No Class mark Fr. Rel. Fr

i = 1:n;
limits = min(x):(max(x) -min(x))/n :max(x);
left_l = limits(i);
right_l = limits(i + 1);

%histogram
[fi, mark] = hist(x,n); 
relfr = fi / N;

fprintf('No |     Class      | Mark  | Frequency | Rel Frequency\n')
res = [i; left_l; right_l; mark; fi; relfr];
fprintf('%3d|[%3.4f, %3.4f]| %3.4f| %3d       | %3.4f\n',res)

hist(x, n)
hold on
plot(mark, fi, 'r','LineWidth',3)

imode = find(fi == max(fi));
resmode = [imode; left_l(imode);right_l(imode);mark(imode);fi(imode);relfr(imode)];
fprintf('Mode\n')
fprintf('%3d|[%3.4f, %3.4f]| %3.4f| %3d       | %3.4f\n',resmode)

Q = prctile(x, [25,50,75]);
fprintf('Quartiles\nQ1=%3.4f, Q2 = %3.4f, Q3 = %3.4f\n',Q)
