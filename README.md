# Earth2014

[![Build Status](https://travis-ci.com/briochemc/Earth2014.jl.svg?branch=master)](https://travis-ci.com/briochemc/Earth2014.jl)
[![Codecov](https://codecov.io/gh/briochemc/Earth2014.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/briochemc/Earth2014.jl)

Download topographic data for the globe.

### Usage

```julia
julia> using Earth2014

julia> x, y, z = Earth2014.load() # or Earth.load(res="1min"), default is "5min"
```

This will download the data via Datadeps.jl only once and make it available for future use.

Then you can use it for your research, or just plot it for example:

```julia
julia> using Plots

julia> heatmap(x, y, z, clim=maximum(abs.(z)).*(-1,1), color=:topo)
```

which should show something like

<img width="1400" alt="5min-resolution global relief plot" src="https://user-images.githubusercontent.com/4486578/76491209-45a19e80-6481-11ea-8d32-815b8a440824.png">


---

### Reference

The data you should cite is

> Christian Hirt, Moritz Rexer,
> Earth2014: 1 arc-min shape, topography, bedrock and ice-sheet models – Available as gridded data and degree-10,800 spherical harmonics,
> International Journal of Applied Earth Observation and Geoinformation,
> Volume 39,
> 2015,
> Pages 103-112,
> ISSN 0303-2434,
> 10.1016/j.jag.2015.03.001.

Note the reference for the data should pop up when you `load()` it.
