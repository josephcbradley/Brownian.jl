using Test

@testset "BrownianMotion" begin
    # Test main constructor
    t = [0.0, 0.1, 0.5, 0.75, 1.0]
    p = BrownianMotion(t)
    @test p.t == t
    @test p.n == length(t)

    # Test rand(p)
    res = rand(p)
    @test res isa Vector{Float64}
    @test length(res) == length(t)
    @test res[1] == 0.0

    # Test rand([p, p])
    res2 = rand([p, p])
    @test res2 isa Matrix{Float64}
    @test size(res2) == (length(t), 2)
    @test all(res2[1, :] .== 0.0)

    # Test range constructor
    p_range = BrownianMotion(0.0:0.1:1.0)
    @test p_range.t == collect(0.0:0.1:1.0)
    @test p_range.n == 11

    # Test t, n constructor
    # BrownianMotion(t::Float64, n::Int64) = BrownianMotion(0.0:t/n:t-t/n)
    p_tn = BrownianMotion(1.0, 5)
    @test p_tn.n == 5
    @test length(p_tn.t) == 5
    @test p_tn.t[1] == 0.0
    @test p_tn.t[end] ≈ 0.8
end
