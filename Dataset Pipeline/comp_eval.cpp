#include<bits/stdc++.h>
using namespace std;

int main(void)
{
	vector<int>result(50);
	for(int i = 0; i<50; i++){
		cout<<"Enter the entry at i = "<<i<<":";
		int temp;
		cin>>temp;
		result[i] = temp;
	}
	cout<<"Final result:"<<endl;
	for(int i = 0; i<result.size(); i++){
		cout<<"i:"<<i<<"Fine tuned performed better:"<<(result[i]==1?"Yes":"NO")<<endl;
	}
	return 0;
}
