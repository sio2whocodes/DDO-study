import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class BJ_1005 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int t = Integer.parseInt(br.readLine());
        while (t-- > 0) {
            StringTokenizer st = new StringTokenizer(br.readLine());

            int n = Integer.parseInt(st.nextToken());
            int k = Integer.parseInt(st.nextToken());

            st = new StringTokenizer(br.readLine());
            int[] d = new int[n + 1];
            for (int i = 1; i <= n; i++) {
                d[i] = Integer.parseInt(st.nextToken());
            }

            ArrayList<Integer>[] order = new ArrayList[n + 1];
            int[] indegree = new int[n + 1];
            for (int i = 1; i <= n; i++) {
                order[i] = new ArrayList<>();
            }
            while (k-- > 0) {
                st = new StringTokenizer(br.readLine());
                int x = Integer.parseInt(st.nextToken());
                int y = Integer.parseInt(st.nextToken());
                order[x].add(y);
                indegree[y]++;
            }
            int w = Integer.parseInt(br.readLine());

            ArrayDeque<Integer> queue = new ArrayDeque<>();
            int[] time = new int[n + 1];
            for (int i = 1; i <= n; i++) {
                if (indegree[i] == 0) {
                    queue.add(i);
                    time[i] = d[i];
                }
            }

            while (!queue.isEmpty()) {
                int cur = queue.poll();

                for (int next : order[cur]) {
                    time[next] = Math.max(time[cur] + d[next], time[next]);
                    indegree[next]--;

                    if (indegree[next] == 0) queue.add(next);
                }
            }

            System.out.println(time[w]);
        }
    }
}
