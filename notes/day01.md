# Day 1 — Julia Setup and Fundamentals

## Environment
- Julia version: 1.11.9
- Python environment: Colab with juliacall
- PySCF and Block2: imported successfully
- KrylovKit: installed successfully
- SVD test: rand(200, 200) completed successfully

## Julia fundamentals
- Variables and basic types
- Integer and floating-point division
- Functions and return values
- Complex numbers: im,abs2
- State normalization
- Probability calculation
- Floating-point precision: isapprox and eps

## Mathematical exercises

For alpha = 1/sqrt(2) and beta = i/sqrt(2):

|alpha|^2 + |beta|^2 = 1

The probability in the positive basis is:

P(+) = |alpha + beta|^2 / 2 = 0.5

## Floating-point precision

Floating-point numbers are represented with finite precision.
Therefore, 0.1 + 0.2 may not be exactly equal to 0.3.

isapprox() checks approximate equality.
eps(Float64) gives the spacing near 1.0 between
representable Float64 numbers.

## Implemented functions
- normalize_state(alpha, beta)
- prob(state, basis)

normalize_state returns Vector{ComplexF64}.
This is an intentional choice for compatibility with
the vector-based state representation used in Day 2.

## Tests
- Pkg.test()
- Real-valued state
- Complex-valued state
- Invalid zero state
- Invalid basis input

## Reference data
- H2 reference data saved in data/reference/h2_project1.csv
