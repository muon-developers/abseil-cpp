def az_artifactory(name):
    sh_binary(
        name = "az-shell",
        srcs = ["script.sh"],
    )
