#include <iostream>
#include <thread>
#include <vector>
#include <utility> 

using namespace std; 

ostream& operator<<(ostream& stream, vector<pair<int, int> > v) {
	for (int i = 0; i < v.size(); i++) {
		stream << i << ": " << v[i].first << " -> " << v[i].second << "\n";
	}

	return stream;
}

vector< pair<int, int> > splitWorkload(int n, int t) {
	vector< pair<int, int> > intervals; 

	int index = 0; 
	int step = n / t; 
	int mod = n % t; 

	while (index < n) {
		intervals.push_back(pair<int, int>(index, index + step + (mod > 0)));
		index += step + (mod > 0);
		mod--; 
	}

	return intervals; 
}

int leftNode(int index) {
	return (2 * index + 1);
}

int rightNode(int index) {
	return (2 * index + 2);
}

bool hasLeftNode(int n, int index) {
	int node = leftNode(index); 
	return (node >= 0 && node < n);
}

bool hasRightNode(int n, int index) {
	int node = rightNode(index);
	return (node >= 0 && node < n); 
}


int scalarPproduct(vector<int> a, vector<int> b, int T) {
	
	vector<int> sums(a.size(), 0);
	vector< pair<int, int> > intervals = splitWorkload(a.size(), T);
	T = intervals.size(); 
	vector<thread> threads;
	threads.resize(T);

	for (int i = T - 1; i >= 0; i--) {
		threads[i] = thread([&, i]() {
			for (int k = intervals[i].first; k < intervals[i].second; k++) {
				sums[i] += a[k] * b[k]; 
			}

			if (hasLeftNode(T, i)) {
				threads[leftNode(i)].join(); 
				sums[i] += sums[leftNode(i)]; 
			}

			if (hasRightNode(T, i)) {
				threads[rightNode(i)].join();
				sums[i] += sums[rightNode(i)];
			}
		});
	}

	threads[0].join(); 
	return sums[0];
}

int main() {

	cout << scalarPproduct({ 1, 2, 3, 4 }, { 2, 3, 4, 5 }, 4); 
	
	int b; 
	cin >> b;

	return 0; 
}