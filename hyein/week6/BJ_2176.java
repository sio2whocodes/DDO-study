package week6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class BJ_2176 {
    static int N;
    static int M;
    static ArrayList<Edge>[] adjList;
    static int[] minPrice;

    static class Edge implements Comparable<Edge> {
        int dest;
        int price;

        public Edge(int dest, int price) {
            this.dest = dest;
            this.price = price;
        }

        @Override
        public int compareTo(Edge o) {
            return this.price - o.price;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());

        adjList = new ArrayList[N + 1];
        for (int i = 1; i <= N; i++) {
            adjList[i] = new ArrayList<>();
        }
        for (int i = 0; i < M; i++) {
            st = new StringTokenizer(br.readLine());
            int start = Integer.parseInt(st.nextToken());
            int dest = Integer.parseInt(st.nextToken());
            int price = Integer.parseInt(st.nextToken());
            adjList[start].add(new Edge(dest, price));
            adjList[dest].add(new Edge(start, price));
        }

        minPrice = new int[N + 1];
        Arrays.fill(minPrice, Integer.MAX_VALUE);
        minPrice[2] = 0;

        int[] dp = new int[N + 1];
        dp[2] = 1;

        PriorityQueue<Edge> pq = new PriorityQueue<>();
        pq.add(new Edge(2, 0));

        while (!pq.isEmpty()) {
            Edge nowEdge = pq.poll();
            int current = nowEdge.dest;

            if (minPrice[current] < nowEdge.price) {
                continue;
            }

            for (Edge nextEdge : adjList[current]) {
                int nextDistance = minPrice[current] + nextEdge.price;
                if (minPrice[nextEdge.dest] > nextDistance) {
                    minPrice[nextEdge.dest] = nextDistance;
                    pq.add(new Edge(nextEdge.dest, nextDistance));
                }
                if (minPrice[nextEdge.dest] > minPrice[current]) {
                    dp[nextEdge.dest] += dp[current];
                }
            }
        }

        System.out.println(dp[1]);
    }
}
