function [] = SaveFigure(h,n,y)
% h,name,y

%���浽��ҵ�����ļ��У���
name=strcat('D:\Windows\OneDrive - mail.scut.edu.cn\�ĵ�\Project\�γ����_��ҵ���\thesis\fig\',n);
namefig=strcat('D:\Windows\OneDrive - mail.scut.edu.cn\�ĵ�\Project\�γ����_��ҵ���\thesis\fig\MatlabFig\',n);
set(h,'PaperPositionMode','manual');
set(h,'PaperUnits','centimeters');
set(h,'PaperPosition',[0,0,15,y]);%ǡ��ѡ��ߴ�
set(h.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
print(h,name,'-r1000','-dpng');%-r600�ɸ�Ϊ300dpi�ֱ���
saveas(h,namefig)
end


