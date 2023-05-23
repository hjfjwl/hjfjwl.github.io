[题目传送门](https://www.luogu.com.cn/problem/AT_abc296_c)

给你 $n,x$ 和一个长度为 $n$ 的数组 $a_1,a_2,...,a_n$ ，问是否存在  i,j(1≤i,j≤n,i≠j) 使得 a i​ −aj​ =x 如果有输出 YES ，否则 NO 。

首先想到的是使用两重循环暴力，但是 $n \le 2 \times 10 ^ 5 $ ,显然会爆。

接着我们可以想到有 map 容器来存储一个数出现的次数，遍历数组但 map 容器中 $a_i + x$ 又出现就可以直接输入 YES 了。

```cpp
#include <iostream>
#include <map>
using namespace std;
int a[200005];
map<int,int>mp;
int main()
{
	int n,c;
	cin >> n >> c;
	for(int i = 1;i<= n;i++)
	{
		cin >> a[i];
		mp[a[i]]++;//次数
	}
	for(int i = 1;i <= n;i++)
	{
		if(mp[a[i] + c])//如果a[i]+c的存在就输出
		{
			cout << "Yes" << endl;
			return 0;
		}
	}
	cout << "No"  << endl;//没有
	return 0;
}
```
