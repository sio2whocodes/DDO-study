//
//  2176.cpp
//  dfsNbfs
//
//  Created by sujeong on 3/26/25.
//

#include <iostream>
#include <vector>
#include <queue>
#include <climits>
using namespace std;

int N, M;
int dp[1001];

vector<int> dijkstra(vector<vector<pair<int,int>>> adj){
    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> pq; // (노드, 거리)
    vector<int> distances(N+1, INT_MAX);
    vector<bool> visit(N+1, false);
    
    distances[2] = 0;
    dp[2] = 1;
    visit[2] = true;
    pq.push({0,2});
    
    while(!pq.empty()) {
        // 인접한 노드 중 가장 짧은 노드 선택
        pair<int,int> cur = pq.top();
        int now = cur.second;
        int d = cur.first;
        pq.pop();
        
        if(d > distances[now]){
            continue;
        }
        
        // distances 갱신 (위에서 선택한 노드를 통해 가는 경우 반영)
        // now와 인접한 노드들 큐에 넣기
        vector<pair<int,int>> edges = adj[now];
        for(int i = 0 ; i < int(edges.size()) ; i++){
            int next = edges[i].first;
            int cost = edges[i].second;
            int nd = d+cost;
            if(distances[next] > nd){
                distances[next] = nd; // 이 부분 때문에, 34라인이 필요 (진행되면서 큐에 들어있던 값보다 더 작은 값으로 갱신됐을 수 있음) -> 이래서 distance 배열에서 매번 제일 작은 수를 탐색하는게 논리적으로는 오점이 없을 수 있을 것 같음..
                pq.push({nd, next});
            }
            
            if(d > distances[next]) {
                dp[now] += dp[next];
            }
        }
    }
    
    return distances;
}

//int getNumOfCases(vector<int> dp, int start, vector<vector<pair<int,int>>> adj, vector<int> distances) {
//    if(dp[start] != -1) {
//        return dp[start];
//    }
//    if(start == 2){
//        dp[start] = 1;
//        return 1;
//    }
//    dp[start] = 0;
//    for(int i = 0 ; i < adj[start].size() ; i++){
//        int next = adj[start][i].second;
//        if(distances[start] > distances[next]) {
//            dp[start] += getNumOfCases(dp, next, adj, distances);
//        }
//    }
//    return dp[start];
//}

int main() {
    cin >> N >> M;
    vector<vector<pair<int,int>>> adj(N+1, vector<pair<int,int>>());

    for(int i = 0 ; i < M ; i++){
        int A, B, C;
        cin >> A >> B >> C;
        
        adj[A].push_back({B, C});
        adj[B].push_back({A, C});
    }
    
    vector<int> distances = dijkstra(adj); // 2부터 모든 노드에 이르기까지 최단거리
    
    cout << dp[1] << endl;
}
