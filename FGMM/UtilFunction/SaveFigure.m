function [] = SaveFigure(h,n,p)% ͼ���ļ���, ����
%% �趨����·�����ļ���
name=strcat('.\Result\',n);
%% �趨�������Ʒֱ���ģʽ
set(h,'PaperPositionMode','manual');
%% �趨��λ
set(h,'PaperUnits','inches');
%% �趨ͼ��λ��
set(h,'PaperPosition',[0,0,7.16,7.16*p]);
%% �趨����������
set(h.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
%% ����Ϊλͼ
print(h,name,'-r600','-dpng');
%% ����Ϊʸ��ͼ
% print(h,name,'-dpdf','-r0');
%% ����Ϊfig��ʽ
% saveas(h,name)
end


