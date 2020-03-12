using Earth2014
using Test

@testset "Earth2014.jl" begin
    x,y,z = Earth2014.load()
    @test x isa Vector
    @test y isa Vector
    @test z isa Array
    @test size(z) == (length(y), lenght(x))
end
