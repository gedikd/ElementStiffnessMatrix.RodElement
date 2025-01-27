function K = rod_element_stiffness_3node(E0, a, A0, b, L)
    
    %   E0: Base modulus of elasticity
    %   a: Coefficient of E(x)
    %   A0: Base cross-sectional area
    %   b: Coefficient of A(x)
    %   L: Length of the rod element
    
    % 3-noded bar element (quadratic shape functions)
    
    % Gauss points and weights for 3-point quadrature
    gaussPoints = [-sqrt(3/5), 0, sqrt(3/5)];
    weights = [5/9, 8/9, 5/9];
    
    % Initialize stiffness matrix (3x3 for 3 nodal elements)
    K = zeros(3, 3);
    
    % Loop over Gauss points
    for r = 1:length(gaussPoints)
        xi = gaussPoints(r);
        Wr = weights(r);
        
        % Shape function derivatives with respect to xi
        dNdxi = [(xi - 0.5), -2*xi, (xi + 0.5)];
        
        % Jacobian (J) and its inverse
        J = L / 2;
        dNdx = dNdxi / J;
        
        % Coordinate x at the Gauss point
        x = (1 + xi) * L / 2;
        
        % Material properties at Gauss point
        % This definitions can be change for each problem
        E = E0 *(1 + a*x);
        A = A0 *(1 + b*x);
        
        % B matrix
        B = dNdx;
        
        % Compute stiffness matrix contribution at this Gauss point
        K = K + (J * (B' * E * A * B) * Wr);
    end
end
