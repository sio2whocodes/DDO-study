package week4;

import java.util.Scanner;

public class BJ_16113 {
    static int[][] nums;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();
        String signal = sc.nextLine();

        int col = n / 5;
        nums = new int[5][col + 2];

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < col; j++) {
                char c = signal.charAt(i * col + j);
                if (c == '#') nums[i][j + 1] = 1;
                else nums[i][j + 1] = 0;
            }
        }

//        System.out.println(Arrays.deepToString(nums));

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i + 2 < col + 2; i++) {
            int num = -1;
            for (int j = 0; j < 10; j++) {
                if (check(i, j)) {
                    num = j;
                    break;
                }
            }

            if (num != -1) {
                sb.append(num);
                if (num == 1) {
                    i += 1;
                } else {
                    i += 2;
                }
            }
        }

        System.out.println(sb);
    }

    public static boolean check(int cur, int num) {
        int[][][] pattern = {
                {{1, 1, 1}, {1, 0, 1}, {1, 0, 1}, {1, 0, 1}, {1, 1, 1}}, // 0
                {{0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}}, // 1
                {{1, 1, 1}, {0, 0, 1}, {1, 1, 1}, {1, 0, 0}, {1, 1, 1}}, // 2
                {{1, 1, 1}, {0, 0, 1}, {1, 1, 1}, {0, 0, 1}, {1, 1, 1}}, // 3
                {{1, 0, 1}, {1, 0, 1}, {1, 1, 1}, {0, 0, 1}, {0, 0, 1}}, // 4
                {{1, 1, 1}, {1, 0, 0}, {1, 1, 1}, {0, 0, 1}, {1, 1, 1}}, // 5
                {{1, 1, 1}, {1, 0, 0}, {1, 1, 1}, {1, 0, 1}, {1, 1, 1}}, // 6
                {{1, 1, 1}, {0, 0, 1}, {0, 0, 1}, {0, 0, 1}, {0, 0, 1}}, // 7
                {{1, 1, 1}, {1, 0, 1}, {1, 1, 1}, {1, 0, 1}, {1, 1, 1}}, // 8
                {{1, 1, 1}, {1, 0, 1}, {1, 1, 1}, {0, 0, 1}, {1, 1, 1}}, // 9
        };

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 3; j++) {
                if (pattern[num][i][j] != nums[i][cur + j]) return false;
            }
        }

        return true;
    }
}
