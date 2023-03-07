function linearAlgebraMultiTest
%linearAlgebraTests Lagrange interpolation tests 

% define the problem environment
clf; format short ; close all
set(0,'DefaultAxesFontSize',24,'defaultlinelinewidth',4);
set(gca,'FontSize',24);% set ploting font size
%rng(101) % fix the random number seed when debugging

% define the problem to be solved
ndata=5; % number of linear data points
nbasis=ndata; % number of basis functions (=ndata for interpolation)

% define the basis function
basisFunction='monomials'; % monomials  trig legendre

% define underlying function to be interpolated
dataSpacing='random'; % random uniform chebyshev 
dataFunction = 'exp'; % poly Runge sine cosine
dataParm= 4; % highest degree (poly) or frequency (sine, cosine)

% define the grid to plot the function and interpolant
xbeg=-1; xend=+1; nplot=101; % range of data set

% evaluate the function being fit and plot it
xplot=linspace(xbeg,xend,nplot);
yplot=genYdata(xplot,dataFunction,dataParm);
plot(xplot,yplot,'b');
title('Linear Algebra Test')
xlabel('x');ylabel('y');

% generate the data and plot the data
[xdata] = genXdata(dataSpacing,xbeg, xend, ndata);
[ydata] = genYdata(xdata, dataFunction,dataParm);
hold on
scatter(xdata,ydata,100,'k','filled')


% set up linear system for Design matrix
nrow=ndata; % number of rows  (data samples)
ncol=nbasis;% number of columns (basis functions)
Adata=NaN(nrow,ncol);
for ic=1:ncol
    for ir=1:nrow
        Adata(ir,ic)=evalBasis(xdata(ir),basisFunction,ic);
    end
end

% Analyze the Design (interpolation) matrix
% disp('Adata');disp(Adata)
condA=1/rcond(Adata);
disp(['condition number of A = ', num2str(condA)])


% solve the linear system
coef=linsolve(Adata,ydata');
% coef=Adata\ydata;
disp('coef');disp(coef')

% check that the solution satisfies the equation
residual=Adata*coef - ydata';
if norm(residual) > 10*eps*condA
    disp(['solution fail residual = ', num2str(norm(residual))]);
    keyboard;
end

% compute the residual at the data points (=0 for interpolation)
yhatdata= evaluateFit(xdata,coef, basisFunction);
resid = norm(yhatdata-ydata);
disp(['resid = ',num2str(resid)])

% plot the fit through the data
yhatplot= evaluateFit(xplot, coef, basisFunction);

% compute the L2 error for the interpolant
L2error=sqrt(trapz(xplot,(yplot-yhatplot).^2));
disp(['L2error = ',num2str(L2error)])
% check with trapizodial rule

hold on
plot(xplot,yhatplot,'r')

end

%------------------

function basis = evalBasis(x, basisFunction, ib)
%evalBasis evaluate the ib-th basis function

switch basisFunction
    case 'monomials'
        basis=x.^(ib-1);

    case 'trig'
        freq=ceil((ib-1)/2)*pi;
        if mod(ib,2)
            basis=cos(x*freq);
        else
            basis=sin(x*freq);
        end

    otherwise
        error(['basisFun= ',basisFun,' not defined'])
end
end


function [xdata, ydata] = genXdata(dataSpacing,xbeg, xend, ndata)
%genXdata generating ndata sample points between xbeg and xend

switch dataSpacing
    case 'uniform'
        xdata=linspace(xbeg,xend,ndata);
        %
    case 'random'
        xdata=xbeg+(xend-xbeg)*rand(1,ndata);
        %
    case 'chebyshev'
        xdata=NaN(1,ndata);
        for ix=1:ndata
        xdata(ix)=0.5*((xbeg+xend)+(xend-xbeg)*cos(pi*(2*ix-1)/(2*ndata)));
        end
    otherwise
        error(['dataSpacing= ',dataSpacing,' not defined'])
end
end


function [ydata]= genYdata(xdata, dataFunction, dataParm)
%genYdata generate data

switch dataFunction
    case 'poly'
        % dataParm is the degree of the polynomial
        ydata=ones(size(xdata));
        for id=1:dataParm
            ydata=ydata+id*xdata.^id;
        end

    case 'Runge'
        ydata = 1 ./ (1 + 25.*xdata.^2);

    case 'sine'
        % dataParm is highest frequency
        ydata=sin(xdata);
        for id=1:dataParm
            ydata=ydata+id*sin(id*xdata*pi);
        end

    case 'cosine'
        % dataParm is highest frequency
        ydata=1;
        for id=1:dataParm
            ydata=ydata+id*cos(id*xdata*pi);
        end
    case 'exp'
        %dataParm is the coeff in the exponent
        ydata = exp(dataParm .* xdata);
    otherwise
        error(['dataFunction= ',dataFunction,' not defined'])
end
end




function y = evaluateFit(x,coef,basisFunction)
% evaluateFit evaluate the polynomial

nbasis = length(coef);
y = coef(1)*evalBasis(x, basisFunction, 1);
for ib=2:nbasis
    y = y + coef(ib)*evalBasis(x, basisFunction, ib);
end

end