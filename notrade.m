function [ outvector ] = notrade(passedtime, invector)
%UNTITLED10 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
append = zeros(1, passedtime) + invector(end);
outvector = [invector append];
end

