using Brownian
using Documenter

DocMeta.setdocmeta!(Brownian, :DocTestSetup, :(using Brownian); recursive=true)

makedocs(;
    modules=[Brownian],
    authors="Joseph Bradley <josephbradley16@googlemail.com> and contributors",
    repo="https://github.com/UniversityofWarwick/Brownian.jl/blob/{commit}{path}#{line}",
    sitename="Brownian.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://UniversityofWarwick.github.io/Brownian.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/UniversityofWarwick/Brownian.jl",
    devbranch="master",
)
