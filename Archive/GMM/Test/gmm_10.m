% ԭʼGMM���+PCA+GMR
% ��������
% ����
clc
clear all
close all



%% �ʻ��ָ�
% �����
n_clusters = 8;

% ��ͼ
I = rgb2gray(imread('../sample/shui.jpg'));
I=imresize(I,0.5);

%�ʻ���ȡ
stroke=FindCurve(I);

% Ԥ����
I = imbinarize(I);
I=~I;

% �����ּ�������
[X(:,1),X(:,2)]=find(I);
% X=X';

%��ʼ������
[Pi, Mu, Sigma]=EM_init_kmeans(X', n_clusters);

%EM�㷨
[Pi, Mu, Sigma] = EM(X', Pi, Mu, Sigma);

%���ݲ�������ģ��
gm=gmdistribution(Mu', Sigma,Pi');

%�Ը�������о���
idx = cluster(gm,X);

% �ʻ��ɷ�ƥ��
% new�ϲ��˵㹴
[com2str ,com2str_new]= impcom2str(stroke,gm);

%% GMR�ع�
trajNum=1001;% ����
strokeNum=size(unique(com2str_new(1,:)),2);%�ʻ���
trajData=zeros(3*strokeNum,trajNum);%�켣
trajSigma=zeros(strokeNum,trajNum);%��ϸ
% trajTime=zeros(strokeNum,trajNum);



for n=unique(com2str_new(1,:))
    %Ѱ�Ҷ�Ӧ�ʻ�n��component
    i=com2str_new(2,com2str_new(1,:)==n);
    %��ÿ��component����ʱ�����
    X_t=[];
    t=0;
    for j=i
        X_n=X(:,idx==j);
        X_n=X_n';
        %���ɷ��ϵ�ͶӰ��Ϊ��ʱ������
        [~,X_n(:,[3,4]),~]=pca(X_n);
        %ȡ��
        X_n(:,3)=round(X_n(:,3));
        %��ʱ������
        X_n=sortrows(X_n,3);
        %�жϷ���
        stroke_temp=stroke(2,stroke(3,:)==n);
        if sign(X_n(1,2)-X_n(end,2)~=sign(stroke_temp(1,1)-stroke_temp(1,end)))
            X_n(:,3)=flip(X_n(:,3));
            X_n=sortrows(X_n,3);
        end
        %����
        X_n(:,3)=X_n(:,3)-X_n(1,3)+t;
        %ƴ��
        X_t=[X_t;[X_n(:,3),X_n(:,[1,2])]];
        %����ĩ��ʱ��
        t=X_t(end,1);
    end
    %�Աʻ����н�ģ
    X_t=X_t';
    [Pi_t, Mu_t, Sigma_t]=EM_init_kmeans(X_t,size(i,2)*3);
    [Pi_t, Mu_t, Sigma_t] = EM(X_t, Pi_t, Mu_t, Sigma_t);
    %�Աʻ�����˹�ع�
    trajData(n*3-2,:)= linspace(min(X_t(1,:)), max(X_t(1,:)), trajNum);
    [trajData(n*3-1:n*3,:), ~] = GMR(Pi_t, Mu_t, Sigma_t, trajData(n*3-2,:),1,2:3);
    %�ʻ���ϸ�ж�
    for k=1:trajNum
        temp=find(X_t(1,:)==round(trajData(n*3-2,k)));
        trajSigma(n,k)=size(temp,2);
    end
end

%% ���ݿ��ӻ�����
% ��ϸ����
trajSigma=trajSigma/2;

% ���Ĵ���
[trajData,X]=centralize(trajData,X);

%% ��������
save('../sample/trajData.mat','trajData');
save('../sample/trajSigma.mat','trajSigma');

%% ��ͼ �켣
figure;
hold on
plot(X(1,:),X(2,:),'.');
for n=1:strokeNum
plot3(trajData(n*3-1,:),trajData(n*3,:),-trajSigma(n,:), 'lineWidth', 3);
end
axis([min(X(1,:))-0.01 max(X(1,:))+0.01 min(X(2,:))-0.01 max(X(2,:))+0.01]);
xlabel('x_1','fontsize',16); ylabel('x_2','fontsize',16);
grid on
hold off   

%% ��ͼ �ع�
figure;
t = 0 : .1 : 2 * pi;
hold on;
for n=1:strokeNum
    for k=1:trajNum
        i = trajSigma(n,k) * cos(t) + trajData(n*3-1,k);
        j = trajSigma(n,k) * sin(t) + trajData(n*3,k);
        patch(i, j, 'black','LineStyle', 'none'); %// plot filled circle with transparency
    end
end
%gscatter(X(1,:),X(2,:),idx);
axis([min(X(1,:))-0.01 max(X(1,:))+0.01 min(X(2,:))-0.01 max(X(2,:))+0.01]);
xlabel('x_1','fontsize',16); ylabel('x_2','fontsize',16);
grid on
hold off
    
%% END



