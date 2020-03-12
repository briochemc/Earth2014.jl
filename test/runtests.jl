using Earth2014
using Test

# For CI, make sure the downloads do not hang
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset "Earth2014.jl" begin
    x,y,z = Earth2014.load()
    @test x isa Vector
    @test y isa Vector
    @test z isa Array
    @test size(z) == (length(y), length(x))
end
