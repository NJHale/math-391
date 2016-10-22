
%Test the forward numericIntegral function 
n = 100;
%Define x and y for plot
x = zeros(n, 1);
fwdY = zeros(n, 1);
fwdRel = zeros(n, 1);
bkwY = zeros(n, 1);
bkwRel = zeros(n, 1);

exactY = zeros(n, 1);

for i = 1 : n
    %Define the function
    fun = @(z) (z.^i) ./ (z + 5);
    %Get the exact integral solution
    exact = integral(fun, 0, 1);
    %Get the approximate solution
    apprx = numericIntegral(i);
    %Calculate relative error
    relErr = relativeError(exact, apprx);
    
    fprintf('Forward Test iteration: %d \tRelative Error: %d\n', i, relErr);
    %set plot values 
    x(i) = i;
    exactY(i) = exact;
    fwdY(i) = apprx;
    fwdRel(i) = relErr;
end

%plot the forward numericIntegral
%plot(x, y, 'red');


for i = 1 : n
    %Define the function
    fun = @(x) (x.^i) ./ (x + 5);
    %Get the exact integral solution
    exact = integral(fun, 0, 1);
    %Get the approximate solution
    apprx = numericIntegralBkw(i);
    %Calculate relative error
    relErr = relativeError(exact, apprx);
    
    fprintf('Backward Test iteration: %d \tRelative Error: %d\n', i, relErr);
    %set plot values 
    bkwY(i) = apprx;
    bkwRel(i) = relErr;
end

%figure
%subplot(1, 1, 'forward vs. exact');
%plot(x, fwdY, 'red');
%hold all;
%plot(x, exactY, 'blue');
%hold all;
%plot(x, bkwY, 'red');
%hold all;
%plot(x, exactY, 'blue'); 
%subplot(1, 1);

plot(x, fwdRel, 'red');
hold all;
plot(x, bkwRel, 'blue');

%subplot(1, 2);

