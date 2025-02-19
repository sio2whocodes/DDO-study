import java.util.*;
import java.io.*;

public class BJ_1260 {
    static ArrayList<ArrayList<Integer>> graph;
    static boolean[] visited;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int v = Integer.parseInt(st.nextToken());

        graph = new ArrayList<>();
        visited = new boolean[n + 1];

        for (int i = 0; i < n + 1; i++) {
            graph.add(new ArrayList<>());
        }

        for (int i = 0; i < m; i++) {
            st = new StringTokenizer(br.readLine());
            int x = Integer.parseInt(st.nextToken());
            int y = Integer.parseInt(st.nextToken());

            graph.get(x).add(y);
            graph.get(y).add(x);
        }

        for (ArrayList<Integer> g : graph) {
            g.sort(Comparator.naturalOrder());
        }

        dfs(v);
        System.out.println();

        visited = new boolean[n + 1];
        bfs(v);
    }

    public static void dfs(int node) {
        visited[node] = true;
        System.out.print(node + " ");

        for (int n : graph.get(node)) {
            if (!visited[n]) {
                dfs(n);
            }
        }
    }

    public static void bfs(int start) throws IOException {
        Queue<Integer> queue = new LinkedList<>();
        queue.add(start);
        visited[start] = true;

        StringBuilder sb = new StringBuilder();

        while (!queue.isEmpty()) {
            int cur = queue.poll();
            sb.append(cur).append(" ");

            for (int i = 0; i < graph.get(cur).size(); i++) {
                int next = graph.get(cur).get(i);

                if (visited[next]) continue;
                visited[next] = true;
                queue.add(next);
            }
        }

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        bw.write(sb.toString());
        bw.flush();
        bw.close();
    }
}
