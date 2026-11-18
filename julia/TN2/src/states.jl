
using LinearAlgebra

function kron_state(states)
    ψ = states[1]
    for ϕ in states[2:end]
        ψ = kron(ψ, ϕ)
    end
    return ψ
end

function coeff_matrix(ψ, dA, dB)
    length(ψ) == dA*dB ||
        throw(ArgumentError("Invalid state dimension"))

    return permutedims(reshape(ψ, dB, dA))
end

function is_product(C; atol=1e-12)
    size(C) == (2, 2) ||
        throw(ArgumentError("C must be a 2x2 matrix"))

    return abs(det(C)) <= atol
end

function state_to_tensor(ψ, dims)
    length(ψ) == prod(dims) ||
        throw(ArgumentError("State length does not match dimensions"))

    T = reshape(ψ, reverse(dims)...)
    perm = reverse(1:length(dims))

    return permutedims(T, perm)
end

function tensor_to_state(T)
    perm = reverse(1:ndims(T))
    return vec(permutedims(T, perm))
end
