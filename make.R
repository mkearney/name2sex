usethis::create_package(".")
1
usethis::use_git()
3
usethis::use_git_ignore()
usethis::use_build_ignore("make.R")
usethis::use_build_ignore("all-data.R")
usethis::use_build_ignore("tw-data.R")

options(usethis.full_name = "Michael Wayne Kearney")
usethis::use_mit_license()
usethis::use_package("tibble")
usethis::use_package_doc()

usethis::use_data(sexdat)
usethis::use_data(twsexdat)


names2sex(c("casi", "mike", "tracy", "rory", "pat", "alex", "tamar"))
