package week5;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class BJ_2533_error {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        ArrayList<Integer>[] tree = new ArrayList[n + 1];
        for (int i = 0; i <= n; i++) {
            tree[i] = new ArrayList<>();
        }

        for (int i = 0; i < n - 1; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int x = Integer.parseInt(st.nextToken());
            int y = Integer.parseInt(st.nextToken());
            tree[x].add(y);
            tree[y].add(x);
        }

        int cnt = 0;
        ArrayList<Integer> early_adapter = new ArrayList<>();
        int[] leaf_child_node = new int[n + 1];
        boolean[] leaf_node = new boolean[n + 1];
        while (early_adapter.size() < n) {
            for (int i = 1; i <= n; i++) {
                if (tree[i].size() == 1) {
                    leaf_child_node[tree[i].getFirst()]++;
                    leaf_node[i] = true;
                }
            }

            int target = 0;
            int max = 0;
            for (int i = 1; i <= n; i++) {
                if (leaf_child_node[i] > max) {
                    max = leaf_child_node[i];
                    target = i;
                }
            }

            early_adapter.add(target);
            ArrayList<Integer> tmp = new ArrayList<>();
            for (int i = 0; i < tree[target].size(); i++) {
                int node = tree[target].get(i);
                if (leaf_node[node]) {
                    tree[node] = new ArrayList<>();
                    tmp.add(node);
                    early_adapter.add(node);
                } else {
                    tree[node].remove(Integer.valueOf(target));
                }
            }

            for (int i = 0; i < tmp.size(); i++) {
                tree[target].remove(Integer.valueOf(tmp.get(i)));
            }

            cnt++;
        }

        System.out.println(cnt);
    }
}
