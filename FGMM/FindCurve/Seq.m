
function [bihua] = Seq(bihua_1)

max_x = max(bihua_1(:,1));
min_x = min(bihua_1(:,1));
max_y = max(bihua_1(:,2));
min_y = min(bihua_1(:,2));
bihua = bihua_1;
if max_x - min_x >= max_y - min_y
    if  bihua_1(1,1)>bihua_1(end,1) %�ӵ�һ��x��ʼ�Ƚ���ֵ������������
        bihua = flipud(bihua_1);
    end
else
    if bihua_1(1,2)>bihua_1(end,2)
        bihua = flipud(bihua_1);
    end    

%% ����
%bihua = flipud(bihua_1);
end