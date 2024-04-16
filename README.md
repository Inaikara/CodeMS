# CodeMS1
## 概要
通过识别图像实现机器人复现书法技能。

## 科研日志
### 28/02/24
今天写了Generalized GMM的绘图代码，主要难点是如何表示一个随着抛物线弯曲的椭圆。解决方法是对包围椭圆的每个点随着抛物线进行“弯曲”。具体做法是将椭圆上点的横坐标作为抛物线的弧长，求解出对应点的坐标，在纵坐标方向加上椭圆上点的纵坐标。

### 10/03
增加了佳乐师兄的代码，可能要对从前的matlab代码进行重写了，对于李娴的代码也许可以用matlab coder进行重构。

### 11/03
一个小想法，能不能用阻抗控制的思想设计视觉控制系统？

### 14/03
coder应该不行，还是重新

## 创新点
1.设计了一种基于FGMM和PCA的自治系统轨迹规划方法。

2.设计了一种更精确的描述样本离散度的回归算法。（和方差做相似度比较）

3.设计了毛笔汉字笔画分割算法

4.设计了基于DMP的机器人书法学习系统。