import java.util.ArrayList;
import java.util.Scanner;

public class BJ_2023 {
    static ArrayList<Integer> result = new ArrayList<>();

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        dfs(n, 0, new StringBuilder());

        for (Integer num : result) {
            System.out.println(num);
        }
    }

    public static void dfs(int n, int depth, StringBuilder num) {
        if (depth == n) {
            result.add(Integer.parseInt(num.toString()));
            return;
        }

        for (int i = 1; i < 10; i++) {
            num.append(i);
            if (isPrime(Integer.parseInt(num.toString()))) dfs(n, depth + 1, num);
            num.deleteCharAt(num.length() - 1);
        }
    }

    public static boolean isPrime(int num) {
        if (num < 2) return false;
        if (num == 2) return true;

        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) return false;
        }

        return true;
    }
}
