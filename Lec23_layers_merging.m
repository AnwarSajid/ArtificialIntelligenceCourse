% CS351-Artificial Intelligence 
% Author: Dr. Sajid Anwar, engrsajidanwar@gmail.com, sajid@giki.edu.pk
% Corresponding video: https://www.youtube.com/watch?v=JWajKJ6012Q&t=61s&pbjreload=10

% Assume 2 consecutive layers with fully connected architecture
% after running this code, compare the result of X3, X3t, and X3tt
% The three vectors should be same (without merging and with merging)


% initialization
clear; clc;
N1 = 2;
N2 = 3;
N3 = 2;

rng('default');

W1 = randi(3, [N1 N2]); B2 = randi(3, [1 N2]);
W2 = randi(3, [N2 N3]); B3 = randi(3, [1 N3]);

X1 = randi(3, [1 N1]);

% usual way to compute solution (linear activation function assumed)
X2 = X1 * W1 + B2; % function f is linear, X2 = f(X1 * W1 + B1);
X3 = X2 * W2 + B3; %------ (1)

% layer merging criterion
X3t = X1 * W1 * W2 + B2 * W2 + B3; % ------ (2)

% W1, W2, B1, and B2 are all fixed (already learnt)
% so we can perform the operations on them as early as possible
W3=W1*W2; temp=B2*W2+B3;
X3tt = X1 * W3 + temp; % ------ (3)

% results of (1), (2) and (3) are same, however the cost is different
% (3) is the fastest (compute the number of multiplications and additions)
fprintf('X3:');
fprintf('%d\t', X3);
fprintf('\n X3t:');
fprintf('%d\t', X3t);
fprintf('\nX3tt:');
fprintf('%d\t', X3tt);
