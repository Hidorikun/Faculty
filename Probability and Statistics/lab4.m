option = input('1 forNormal, 2 for T, 3 for Chi2, 4 for F');

switch (option)
    case 1
            x0 = input('x0=');
            x1 = input('x1=');
            x2 = input('x2=');
            alfa = input('alfa=');
            beta = input('beta=');
            %normal distribution

            niu = input('niu (in R)=');
            sigma = input('sigma (>0)=');

            %a)

            Pa = normcdf(x0, niu, sigma);

            %b)

            Pb = 1 - Pa;

            %c)

            Pc = normcdf(x2,niu,sigma) - normcdf(x1,niu,sigma);

            %d)

            Pd = 1 - Pc

            %e)

            Pe = norminv(alfa,niu,sigma);

            %f)

            Pf = norminv(1 - beta, niu, sigma);
    case 2
            x0 = input('x0=');
            x1 = input('x1=');
            x2 = input('x2=');
            alfa = input('alfa=');
            beta = input('beta=');
            
            n = input('degrees of freedom=');
            
            
            %a)

            Pa = tcdf(x0, n);

            %b)

            Pb = 1 - Pa;

            %c)
            
            Pc = tcdf(x2,n) - tcdf(x1,n);

            %d)

            Pd = 1 - Pc

            %e)

            Pe = tinv(alfa,n);

            %f)

            Pf = tinv(1 - beta, n);
            
    case 3
        
            x0 = input('x0=');
            x1 = input('x1=');
            x2 = input('x2=');
            alfa = input('alfa=');
            beta = input('beta=');
            
            n = input('n=');
            
            
            %a)

            Pa = chi2cdf(x0, n);

            %b)

            Pb = 1 - Pa;

            %c)
            
            Pc = chi2cdf(x2,n) - tcdf(x1,n);

            %d)

            Pd = 1 - Pc

            %e)

            Pe = chi2inv(alfa,n);

            %f)

            Pf = chi2inv(1 - beta, n);
            
end

fprintf('Ans in a)=%1.5f\n', Pa)
fprintf('Ans in b)=%1.5f\n', Pb)
fprintf('Ans in c)=%1.5f\n', Pc)
fprintf('Ans in d)=%1.5f\n', Pd)
fprintf('Ans in e)=%1.5f\n', Pe)
fprintf('Ans in f)=%1.5f\n', Pf)