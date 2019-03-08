#include <iostream>
#include <thread>
#include <vector>
#include <string> 
#include <atomic>
#include <mutex> 

using namespace std; 

bool matrix[100][100]; 
atomic<bool> foundSolution = false; 
mutex mtx; 

vector<int> colors;

bool isValidColor(int node, int color, bool matrix[100][100], vector<int> currentColors) {

	for (int i = 0; i < currentColors.size(); i++) {
		if (matrix[node][i] == true && color == currentColors[i]) {
			return false;
		}
	}
	return true;
}

void backtracking(vector<int> temp, int T, int k, int n) {

	if (foundSolution) return; 

	if (temp.size() == n) {
		mtx.lock();
		if (!foundSolution) {
			for (int i = 0; i < n; i++)
				colors.push_back(temp[i]); 
			foundSolution = true;
			
		}
		mtx.unlock(); 
		return; 
	}

	if (T == 1) {
		for (int color = 1; color <= k; color++) {
			if (isValidColor(temp.size(), color, matrix, temp)) {
				temp.push_back(color); 
				backtracking(temp, T, k, n);
				temp.pop_back();
			}
		}
	}
	else {
		vector<int> x(temp); 

		thread t([&](){
			for (int color = 1; color <= k; color += 2) {
				if (isValidColor(x.size(), color, matrix, x)) {
					x.push_back(color);
					backtracking( x, T/2, k, n); 
					x.pop_back(); 
				}
			}
		});

		for (int color = 2; color <= k; color += 2) {
			if (isValidColor(temp.size(), color, matrix, temp)) {
				temp.push_back(color);
				backtracking(temp, T - T/2, k, n);
				temp.pop_back();
			}
		}

		t.join();
	}
}

int main() {
	int n = 5; 

	for (int i = 1; i <= n; i++) {
		for (int j = 1; j <= n; j++) {
			matrix[i][j] = false; 
		}
	}

	matrix[0][1] = true; 
	matrix[1][3] = true; 
	matrix[2][3] = true; 
	matrix[2][4] = true; 
	matrix[3][4] = true; 

	matrix[1][0] = true; 
	matrix[3][1] = true; 
	matrix[3][2] = true; 
	matrix[4][2] = true; 
	matrix[4][3] = true; 

	//colors are from 1 to k
	int k = 3; 


	backtracking(vector<int>(), 2, k, n); 

	for (int i = 0; i < n; i++) {
		cout << colors[i] << " ";
	}

	string str; 
	cin >> str; 

	return 0; 
}