
using Test
using TN2

@testset "TN2 tests" begin

    # Real-valued state
    state = normalize_state(3, 4)

    @test state isa Vector{ComplexF64}
    @test isapprox(abs2(state[1]) + abs2(state[2]), 1.0)
    @test isapprox(prob(state, 0), 0.36)
    @test isapprox(prob(state, 1), 0.64)

    # Complex-valued state
    α = 1 / sqrt(2)
    β = im / sqrt(2)

    complex_state = normalize_state(α, β)

    @test isapprox(abs2(complex_state[1]), 0.5)
    @test isapprox(abs2(complex_state[2]), 0.5)
    @test isapprox(prob(complex_state, 0), 0.5)
    @test isapprox(prob(complex_state, 1), 0.5)

    # Invalid inputs
    @test_throws ErrorException normalize_state(0, 0)
    @test_throws ErrorException prob(state, 2)

end
