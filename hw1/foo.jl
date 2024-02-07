function augmented_lagrangian(
    qp::NamedTuple,
    x::Vector,
    λ::Vector,
    μ::Vector,
    ρ::Real,
)::Real
    cost(qp, x) +
    dot(λ, c_eq(qp, x)) +
    dot(μ, h_ineq(qp, x)) +
    0.5 *
    ρ *
    c_eq(qp, x)' *
    c_eq(qp, x) +
    0.5 *
    h_ineq(qp, x)' *
    mask_matrix(qp, x, μ, ρ) *
    h_ineq(qp, x)
end