function [ outvector ] = notrade(passedtime, invector)
%UNTITLED10 此处显示有关此函数的摘要
%   此处显示详细说明
append = zeros(1, passedtime) + invector(end);
outvector = [invector append];
end

