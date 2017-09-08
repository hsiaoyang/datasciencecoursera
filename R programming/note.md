## 学习R语言要点整理

### 去除数据框中的NA

> x<-data.frame(x1=c(1,NA,2,23),x2=c(3,4,NA,3),x3=c(5,3,9,78))```

```
打印x，输入结果如下：
x1  x2   x3
1   3   5
NA  4   3
2   NA  9
23  3   78
```

> complete.cases(x)

```
结果：TRUE FALSE FALSE
说明：complete.cases()判断 x的每行是否有NA，返回布尔值
```

> x[complete.cases(x),]


```
移除x中含有含有NA的行
输出结果如下：
x1 x2 x3
1  3  5
23  3 78
```
