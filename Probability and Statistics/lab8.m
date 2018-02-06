x = [20 * ones(1,2), 21, 22 *ones(1,3), 23 * ones(1,6),...
    24 * ones(1,5), 25 * ones(1,9), 26 * ones(1,2), 27 * ones(1,2)];

y = [75*ones(1,3), 76*ones(1,2), 77*ones(1,2), 78*ones(1,5),... 
    79*ones(1,8), 80*ones(1,8), 81, 82];

mx = mean(x);
my = mean(y);
fprintf('The means are mX = %3.4f , mY = %3.4f\n',mx,my)

%these are the populations (var(x,1))
vx = var(x,1);
vy = var(y,1);

fprintf('The variances are vX = %3.4f , vY = %3.4f\n',vx,vy)
mycov = cov(x,y,1);

fprintf('The covariance is %3.4f.\n',mycov(1,2))

mycorrcoef = corrcoef(x,y);

fprintf('The correlation coefficient is %3.4f.\n',mycorrcoef(1,2))

%scattergram
clf
scatter(x,y)
hold on
%line of regression
xregr = x;
yregr = my + mycorrcoef(1,2)*(sqrt(vy)/sqrt(vx))*(xregr - mx);
plot(xregr,yregr,'r')

% nu mai folosim var(x), std(x), cov(x,y), notatia variantei
% e s^2 = 1/(N-1)SIGMA(Xi - x(mx))^2 , s^2 = var(x)
