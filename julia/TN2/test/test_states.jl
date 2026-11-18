
using Test
using LinearAlgebra

include("states.jl")

@testset "Quantum States and Tensor Operations" begin

    ket0 = ComplexF64[1, 0]
    ket1 = ComplexF64[0, 1]
    plus = ComplexF64[1, 1] / sqrt(2)

    @testset "Kronecker State" begin

        psi01 = kron_state([ket0, ket1])
        psi10 = kron_state([ket1, ket0])

        @test psi01 ≈ ComplexF64[0, 1, 0, 0]
        @test psi10 ≈ ComplexF64[0, 0, 1, 0]

        psi = kron_state([ket0, plus, ket1])

        @test length(psi) == 8
        @test norm(psi) ≈ 1.0

    end

    @testset "Coefficient Matrix" begin
        psi01 = kron_state([ket0, ket1])

        C01 = coeff_matrix(psi01, 2, 2)

        @test C01 ≈ [0 1; 0 0]

        psi23 = kron(
              ComplexF64[1, 0],
              ComplexF64[0, 0, 1]
          )

        C23 = coeff_matrix(psi23, 2, 3)

        @test C23 ≈ [0 0 1; 0 0 0]

        psi_plus = ComplexF64[1, 1, 1, 1] / 2
        psi_bell = ComplexF64[1, 0, 0, 1] / sqrt(2)

        @test coeff_matrix(psi_plus, 2, 2) ≈
                [0.5 0.5; 0.5 0.5]

        @test coeff_matrix(psi_bell, 2, 2) ≈
                [1/sqrt(2) 0; 0 1/sqrt(2)]

        @test_throws ArgumentError coeff_matrix(psi_plus, 3, 2)

    end

    @testset "Product State Detection" begin
        C_product = [0.5 0.5; 0.5 0.5]
        C_bell = [1/sqrt(2) 0; 0 1/sqrt(2)]

        @test is_product(C_product)
        @test !is_product(C_bell)
        @test_throws ArgumentError is_product(zeros(3, 3))
    end

    @testset "State-Tensor Round Trip" begin
        psi = ComplexF64[1, 2, 3, 4, 5, 6, 7, 8]

        T = state_to_tensor(psi, (2, 2, 2))
        recovered = tensor_to_state(T)

        @test size(T) == (2, 2, 2)
        @test recovered ≈ psi
        @test norm(recovered - psi) <= 1e-14

        @test_throws ArgumentError state_to_tensor(psi, (2, 2))
    end

end
