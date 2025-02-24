package("cxxopts")

    set_homepage("https://github.com/jarro2783/cxxopts")
    set_description("Lightweight C++ command line option parser")

    add_urls("https://github.com/jarro2783/cxxopts.git")
    add_urls("https://github.com/jarro2783/cxxopts/archive/$(version).tar.gz")
    add_versions("v2.2.0", "447dbfc2361fce9742c5d1c9cfb25731c977b405f9085a738fbd608626da8a4d")

    on_install(function (package)
        os.cp("include/*.hpp", package:installdir("include"))
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            static void test() {
                cxxopts::Options options("MyProgram", "One line description of MyProgram");
                options.add_options()
                  ("d,debug", "Enable debugging") // a bool parameter
                  ("i,integer", "Int param", cxxopts::value<int>())
                  ("f,file", "File name", cxxopts::value<std::string>())
                  ("v,verbose", "Verbose output", cxxopts::value<bool>()->default_value("false"));
            }
        ]]}, {configs = {languages = "c++11"}, includes = "cxxopts.hpp"}))
    end)    
    
