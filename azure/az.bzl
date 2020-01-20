def _artifacts_repo_impl(ctx):
   print("Inside implementation block")
   ctx.execute(["az",
   "artifacts",
   "universal",
   "download",
   "--organization", "https://dev.azure.com/minervapoc",
   "--scope", "project",
   "--project", "minerva-poc-github",
   "--feed", "libs",
   "--name", "rules_cc",
   "--version", "1.0.0",
   "--path", "."])
   #ctx.extract(ctx.attr.archive) # extract the zip

az_artifacts_repo = repository_rule(
    implementation = _artifacts_repo_impl,
    local = True,
    attrs = {
        "url": attr.string(
            mandatory = True,
        ),
        "archive": attr.string(
            mandatory = True,
        ),
    },
)