[题目传送门](https://www.luogu.com.cn/problem/AT_abc303_d)

题目大意：

给你三个数 x,y,z 分别代表，按下 a 键需要用 x 个单位时间，同时按 Shift 和 a 键要 y 个单位时间，z 表示按下 CapsLock 键所需时间，求打出字符串 s 所需的最少时间。

这是一道 dp 题目。 用 dp[i][j] 表示到第 i 个字符结束后 CapsLock 是亮的还是暗的，0 代表暗的，1 代表亮的。

我们对它进行分类讨论如果 s[i] 是小写的话，dp[i][0] = min(dp[i][0] + x,dp[i][1] + min(z + x,z + y))，$dp[i][1] = min(dp[i - 1][0] + min(z + x,z + y),dp[i - 1][1] + y)。

如果是大写的话，dp[i][1] = min(dp[i - 1][1] + x,dp[i - 1][0] + z + min(x,y))，dp[i][0] = min(dp[i - 1][1] + z + \min(x,y),dp[i - 1][0] + y)。

AC code:
```cpp
#include <iostream>
#include <cstring>
using namespace std;
#define int long long
int dp[300005][2];
//0代表小写,1代表大写 
signed main()
{
	int x,y,z;
	cin >> x >> y >> z;
	string s;
	cin >> s;
	if(s[0] == 'a')
	{
		dp[1][0] = x;
		dp[1][1] = min(x + z,y + z);
	}
	else
	{
		dp[1][0] = y;
		dp[1][1] = min(x +z,y + z);
	}
  	//第一个字符
	for(int i = 1;i < s.size();i++)
	{
		if(s[i] == 'a')
		{
			dp[i + 1][0] = min(dp[i][0] + x,dp[i][1] + min(z + x,z +y));
			dp[i + 1][1] = min(dp[i][0] + min(z + x,z + y),dp[i][1] + y); 
		}
		else
		{
			dp[i + 1][1] = min(dp[i][1] + x,dp[i][0] + z + min(x,y));
			dp[i + 1][0] = min(dp[i][1] + z + min(x,y),dp[i][0] + y); 
		}
	}
	int n = s.size();
	cout << min(dp[n][0],dp[n][1]);//找最优的
	return 0;
}
```
