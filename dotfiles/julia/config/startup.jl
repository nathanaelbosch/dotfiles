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
    @eval using Pkg
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
