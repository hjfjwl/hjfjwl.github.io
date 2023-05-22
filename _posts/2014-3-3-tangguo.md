---
title: P9226糖果的题解
date: 2023-05-19 21:19:19
tags:
---
[题目传送门](https://www.luogu.com.cn/problem/P9226)
#### 题目大意：

你要在这个队列后面增加 x(x≥1) 个人,问 x 至少是多少才能使得队列总数是 k 的倍数。

我们可以发现答案就是 k - n %k。

AC 代码：
```cpp
#include <iostream>
using namespace std;
#define int long long

signed main()
{
	int n,k;
	cin >> n >> k;
	cout << k - n % k << endl;
	return 0;
}
```
