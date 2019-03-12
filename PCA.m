T = 50;
% Chosen final time

[xData,yData,zData] = lorenz(28, 10, 8/3, [1;0;0], [0,T], 1e-6);      
% Relies on lorenz.m to create sets of points from a Lorenz attractor

% Adds random noise
for i = 1:length(xData)
    xData(i) = xData(i) + normrnd(0,1);
    yData(i) = yData(i) + normrnd(0,1);
    zData(i) = zData(i) + normrnd(0,1);
end


% Size of data set vs. Size of "moving average" 
N = length(xData);
k = 10;

X = zeros(k,N-k);

for i = 1:N-k
    X(i,i:i+k) = xData(i:i+k);
end

% Obtaining transformed data matrix by using SVD
S = X'*X/(N-1);
[U,L,V] = svd(S);
Z = X*V;