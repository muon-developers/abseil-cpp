def _artifacts_repo_impl(ctx):
   print("Inside implementation block")
   directory = ctx.attr.archive[:-4] + "/"
   ctx.execute(["az",
   "artifacts",
   "universal",
   "download",
   "--organization", "https://dev.azure.com/minervapoc",
   "--scope", "project",
   "--project", "minerva-poc-github",
   "--feed", "libs",
   "--name", ctx.attr.name,
   "--version", ctx.attr.version,
   "--path", "."])   
   ctx.extract(ctx.attr.archive) # extract the zip
   
   ctx.delete(ctx.attr.archive) # delete the already extarcted zip
   ctx.execute(["cp", "-n", "-R", directory, "."], quiet=False) 
   ctx.delete(directory)

az_artifacts_repo = repository_rule(
    implementation = _artifacts_repo_impl,
    local = True,
    attrs = {
        "archive": attr.string(
            mandatory = True,
        ),
        "package": attr.string(
            mandatory = True,
        ),
        "version": attr.string(
            mandatory = True,
        ),
    },
)