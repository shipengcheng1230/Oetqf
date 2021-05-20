module Oetqf

using Reexport

@reexport using OrdinaryDiffEq
@reexport using DiffEqCallbacks
@reexport using RecursiveArrayTools
@reexport using HDF5
@reexport using GmshTools
@reexport using LinearAlgebra

using Parameters
using GeoGreensFunctions
using FFTW
using Strided
using Printf

using Base.Threads

include("io.jl")

const BEM_DIR = joinpath(@__DIR__, "BEM")
const BEM_SRC = ["mesh.jl", "GF.jl", "property.jl", "equation.jl"]
foreach(x -> include(joinpath(BEM_DIR, x)), BEM_SRC)

export
    gen_mesh, gen_gmsh_mesh,
    stress_greens_function, StrikeSlip,
    RateStateQuasiDynamicProperty, PowerLawViscosityProperty,
    assemble,
    wsolve

end # module
