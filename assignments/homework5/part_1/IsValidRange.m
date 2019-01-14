function [ res ] = IsValidRange( A, x, y )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
    res = x >= 1 && x <= size(A, 1) && y >= 1 && y <= size(A, 2);

end

