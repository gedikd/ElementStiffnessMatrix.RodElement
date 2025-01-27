function K = rod_element_stiffness_2node(E0, a, A0, b, L)
    
    %   E0: Constant modulus of elasticity
    %   a:  Coefficient for linear variation of E(x)
    %   A0: Constant cross-sectional area
    %   b:  Coefficient for linear variation of A(x)
    %   L:  Length of the rod element
   
    % 2-noded bar element (linear shape functions)
    
    % Gauss points and weights for 2-point quadrature
    gaussPoints = [-1/sqrt(3), 1/sqrt(3)];
    weights = [1, 1];
    
    % Initialize stiffness matrix (2x2 for 2 nodal elements)
    K = zeros(2, 2);
    
    % Loop over Gauss points
    for r = 1:length(gaussPoints)
        xi = gaussPoints(r);
        Wr = weights(r);
        
        % Shape function derivatives with respect to xi
        dNdxi = [-0.5, 0.5];
        
        % Jacobian (J) and its inverse
        J = L / 2;
        dNdx = dNdxi / J;
        
        % Coordinate x at the Gauss point
        x = (1 + xi) * L / 2;
        
        % Material properties at Gauss point
        % This definitions can be change for each problem
        E = E0 * (1 + a* x);
        A = A0 * (1 - b * x);
        
        % B matrix
        B = dNdx;
        
        % Compute stiffness matrix contribution at this Gauss point
        K = K + (J * (B' * E * A * B) * Wr);
    end
end
