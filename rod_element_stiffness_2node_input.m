clear;clc;

E0 = 200e9;  % Elasticity modulus in Pa
a = 0;       % Variation coefficient for E(x)
A0 = 0.01;   % Cross-sectional area in m^2
b = 0.03;    % Variation coefficient for A(x)
L = 1.0;     % Length of the rod in meters

% Dont forget to change mathematical definition of E(X) and A(x)
% in the funtion definition.

K = rod_element_stiffness_2node(E0, a, A0, b, L)
