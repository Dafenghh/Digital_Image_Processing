function [ res ] = IsValidRange( A, x, y )
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    res = x >= 1 && x <= size(A, 1) && y >= 1 && y <= size(A, 2);

end

