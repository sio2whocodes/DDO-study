package week5;

import java.util.*;
import java.io.*;

public class BJ_2606 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int m = Integer.parseInt(br.readLine());

        ArrayList<Integer>[] network = new ArrayList[n+1];
        for (int i = 0; i <= n; i++) {
            network[i] = new ArrayList<>();
        }
        while (m-- > 0) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            network[a].add(b);
            network[b].add(a);
        }

        ArrayDeque<Integer> queue = new ArrayDeque<>();
        queue.add(1);

        boolean[] visited = new boolean[n+1];
        int cnt = 0;
        while (!queue.isEmpty()) {
            int cur = queue.poll();
            visited[cur] = true;
            cnt++;

            for (int next : network[cur]) {
                if (!visited[next] && !queue.contains(next)) {
                    queue.add(next);
                }
            }
        }

        System.out.println(cnt-1);
    }
}
