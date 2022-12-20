
class LCG
{
    int X = 1;  // 1をシード値とします
    const int A = 1664525;
    const int C = 1013904223;
    const int M = 2147483647; // 2^31
    public int Rand()
    {
        X = (X * A + C) & M;
        return X;
    }
}