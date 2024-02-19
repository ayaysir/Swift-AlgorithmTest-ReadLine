#  시간 복잡도
- https://www.acmicpc.net/problem/24263

##  알고리즘 수업 - 알고리즘의 수행 시간 1
```
MenOfPassion(A[], n) {
    i = ⌊n / 2⌋;
    return A[i]; # 코드1
}
```
- O(1)
- 최고차항: 0

## 알고리즘 수업 - 알고리즘의 수행 시간 2
```
MenOfPassion(A[], n) {
    sum <- 0;
    for i <- 1 to n
        sum <- sum + A[i]; # 코드1
    return sum;
}
```
- O(N)
- 최고차항: 1

## 알고리즘 수업 - 알고리즘의 수행 시간 3
```
MenOfPassion(A[], n) {
    sum <- 0;
    for i <- 1 to n
        for j <- 1 to n
            sum <- sum + A[i] × A[j]; # 코드1
    return sum;
}
```

- O(N^2)
- 최고차항: 2

## 알고리즘 수업 - 알고리즘의 수행 시간 4
```
MenOfPassion(A[], n) {
    sum <- 0;
    for i <- 1 to n - 1
        for j <- i + 1 to n
            sum <- sum + A[i] × A[j]; # 코드1
    return sum;
}
```
- O((N^2-N)/2)
- 최고차항: 2

## 알고리즘 수업 - 알고리즘의 수행 시간 5
```
MenOfPassion(A[], n) {
    sum <- 0;
    for i <- 1 to n
        for j <- 1 to n
            for k <- 1 to n
                sum <- sum + A[i] × A[j] × A[k]; # 코드1
    return sum;
}
```
- O(N^3)
- 최고차항: 3

## 알고리즘 수업 - 알고리즘의 수행 시간 6
```
MenOfPassion(A[], n) {
    sum <- 0;
    for i <- 1 to n - 2
        for j <- i + 1 to n - 1
            for k <- j + 1 to n
                sum <- sum + A[i] × A[j] × A[k]; # 코드1
    return sum;
}
```
- 1 + (1+2) + (1+2+3) + ... + (1+2+3+...+(N-2))
- O(N⋅(N-1)⋅(N-2) / 6) => O(N^3 − 3N^2 + 2N)
- 최고차항: 3
