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
using Plots


