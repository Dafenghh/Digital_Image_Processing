function [rst] = wienerFilter(H, k)
    rst = H .^ (-1) .* (abs(H) .^2 ./ (abs(H) .^2 + k));
end

