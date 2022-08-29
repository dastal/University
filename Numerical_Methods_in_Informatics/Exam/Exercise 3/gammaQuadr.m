function [Iq] = gammaQuadr(y1, y2, y3, gammas)
    Iq= gammas(1)*y1 + gammas(2)*y2 + gammas(3)*y3;
end
