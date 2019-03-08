// This program computes the prime numbers from [2, N] using T threads

#include<iostream>
#include<thread>
#include<mutex>
#include<vector>

using namespace std; 

bool isPrime(int x) {
	for (int i = 2; i < x; i++) {
		if (x % i == 0) {
			return false; 
		}
	}

	return true; 
}

int main() {

	vector<int> primes; 
	vector<thread> threads; 
	mutex mtx; 

	int N, T; 
	cout << "N = "; cin >> N;
	cout << "T = "; cin >> T; 

	for (int i = 0; i < T; i++) {
		threads.push_back(thread([i, &primes, N, T, &mtx](){
			for (int j = 2 + i; j <= N; j += T) {
				if (isPrime(j)) {
					mtx.lock(); 
					primes.push_back(j); 
					mtx.unlock(); 
				}
			}
		}));
	}

	for (int i = 0; i < T; i++) {
		threads[i].join(); 
	}

	for (int i = 0; i < primes.size(); i++) {
		cout << primes[i] << " ";
	}

	cin >> N;
	return 0; 
}