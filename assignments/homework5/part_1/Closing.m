function [ res ] = Closing( A, B, origin_x, origin_y )
    res = Erosion(Dilation(A, B, origin_x, origin_y), B, origin_x, origin_y);
end

