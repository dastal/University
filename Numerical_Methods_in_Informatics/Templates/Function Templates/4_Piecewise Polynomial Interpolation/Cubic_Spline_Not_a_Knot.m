function [not_a_knot] = Cubic_Spline_Not_a_Knot(nodes,yys,xValues)
    % Wants nodes, y values of nodes and array equispaced s Values in the
    % wanted interval
    not_a_knot = spline(nodes,yys,xValues);
end
