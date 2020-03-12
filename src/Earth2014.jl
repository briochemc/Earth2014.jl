module Earth2014

using DataDeps, NCDatasets

function url_Earth2014(;res="5min")
    res == "1min" ? "http://ddfe.curtin.edu.au/models/Earth2014/data_1min/GMT/Earth2014.BED2014.1min.geod.grd" :
    res == "5min" ? "http://ddfe.curtin.edu.au/models/Earth2014/data_5min/GMT/Earth2014.BED2014.5min.geod.grd" :
    error("not a valid resolution")
end

function sha_Earth2014(;res="5min")
    res == "1min" ? sha2_256 :
    res == "5min" ? sha2_256 :
    error("not a valid resolution")
end

"""
    register_Earth2014()

Registration of the Earth2014 dataset using DataDeps.jl

Original location of Earth2014
http://ddfe.curtin.edu.au/models/earth2014/data_5min/gmt/earth2014.bed2014.5min.geod.grd
"""
function register_Earth2014(;res="5min")
    register(
        DataDep(
            "Earth2014_$res",
            """
            Reference:
            - $(citation()).
            """,
            url_Earth2014(res=res),
            sha_Earth2014(res=res),
            fetch_method = fallback_download
        )
    )
    return nothing
end

function fallback_download(remotepath, localdir)
    @assert(isdir(localdir))
    filename = basename(remotepath)  # only works for URLs with filename as last part of name
    localpath = joinpath(localdir, filename)
    Base.download(remotepath, localpath)
    return localpath
end

citation() = """
             Hirt, C. and M. Rexer (2015), Earth2014: 1 arc-min shape, topography, bedrock 
             and ice-sheet models — available as gridded data and degree-10,800 spherical 
             harmonics, International Journal of Applied Earth Observation and Geoinformation
             39, 103–112, doi:10.10.1016/j.jag.2015.03.001.
             """


"""
    load

Returns the Earth2014 data as a 2D array?
"""
function load(;res="5min")
    register_Earth2014(res=res)
    nc_file = @datadep_str string("Earth2014_$res/Earth2014.BED2014.$res.geod.grd")

    @info """You are about to use the Earth2014 data at $res resolution.
          If you use it for research, please cite:

          - $(citation())

          You can find the corresponding BibTeX entry in the CITATION.bib file
          at the root of the Earth2014.jl package repository.
          """
    x, y, z = Dataset(nc_file, "r") do ds
        ds["x"][:], ds["y"][:], permutedims(ds["z"][:,:], [2,1])
    end
    return x, y, z
end

end # module
