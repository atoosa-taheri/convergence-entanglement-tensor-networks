
module TN2

export normalize_state, prob

function normalize_state(α, β)
    state_norm = sqrt(abs2(α) + abs2(β))

    if isapprox(state_norm, 0.0)
        error("Cannot normalize a zero state")
    end

    return ComplexF64[α / state_norm, β / state_norm]
end

function prob(state, basis)
    if basis == 0
        return abs2(state[1])
    elseif basis == 1
        return abs2(state[2])
    else
        error("Basis must be 0 or 1")
    end
end

end
