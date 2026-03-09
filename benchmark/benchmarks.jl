using BenchmarkTools
using Brownian

const SUITE = BenchmarkGroup()

SUITE["univariate"] = BenchmarkGroup()

SUITE["univariate"]["FBM"] = BenchmarkGroup()
SUITE["univariate"]["FBM"]["rand_rl"] = @benchmarkable rand($FBM(1.0, 100), method=:rl)
SUITE["univariate"]["FBM"]["rand_fft"] = @benchmarkable rand($FBM(1.0, 100), method=:fft)

SUITE["univariate"]["BrownianMotion"] = BenchmarkGroup()
SUITE["univariate"]["BrownianMotion"]["rand"] = @benchmarkable rand($BrownianMotion(1.0, 100))

SUITE["multivariate"] = BenchmarkGroup()
SUITE["multivariate"]["MvBrownianMotion"] = BenchmarkGroup()

cov_mat = [1.0 0.5; 0.5 1.0]
SUITE["multivariate"]["MvBrownianMotion"]["rand"] = @benchmarkable rand($MvBrownianMotion(1.0, 100, $cov_mat))
