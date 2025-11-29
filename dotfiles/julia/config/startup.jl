using Pkg

ENV["EDITOR"] = "vim"
# ENV["PYTHON"] = "python"

function activate_default_packages()
    @eval using Revise
    @eval using OhMyREPL
    @eval colorscheme!("GruvboxDark")
    # @eval using AbbreviatedStackTraces
    # @eval ENV["JULIA_STACKTRACE_MINIMAL"] = true
    @eval using BenchmarkTools
    # @eval using Logging: global_logger
    # @eval using TerminalLoggers
    # @eval global_logger(TerminalLogger())
    # @eval using Eyeball
    @eval using TestEnv
end

try
    activate_default_packages()
catch err
    @error "Could not load startup packages. To install, use `_setup()`" err
end

function _setup()
    Pkg.add([
        "Revise",
        "OhMyREPL",
        "BenchmarkTools",
        # "TerminalLoggers",
        # "Eyeball",
        "AbbreviatedStackTraces",
        "TestEnv",
    ])
    activate_default_packages()
end

function _update()
    # Update a set of environments:
    # global, @Pluto,
    Pkg.update()
    envs = [
        "@Pluto",
        "@JuliaFormatter",
    ]
    for env in envs
        Pkg.activate(env)
        Pkg.update()
    end
    Pkg.activate() # back to global
end
