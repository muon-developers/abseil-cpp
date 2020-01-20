AZ_DEVOPS_ORG = "https://dev.azure.com/minervapoc"
AZ_DEVOPS_PROJECT = "minerva-poc-github"
AZ_ARTIFACTS_FEED = "libs"
AZ_SCOPE_PROJECT = "project"

def _az_artifacts_deps_impl(ctx):
   print("Entering _az_artifacts_deps_impl...")

   temp_dir = ctx.attr.archive[:-4] + "/"

   ctx.execute(["az",
   "artifacts",
   "universal",
   "download",
   "--organization", AZ_DEVOPS_ORG,
   "--scope", AZ_SCOPE_PROJECT,
   "--project", AZ_DEVOPS_PROJECT,
   "--feed", AZ_ARTIFACTS_FEED,
   "--name", ctx.attr.name,
   "--version", ctx.attr.version,
   "--path", "."])   
   ctx.extract(ctx.attr.archive) # extracts the zip
   ctx.delete(ctx.attr.archive) # deletes the already extracted zip
   ctx.execute(["cp", "-n", "-R", temp_dir, "."], quiet=False) # copy the directory content to one level up
   ctx.delete(temp_dir) # deletes the temp directory

az_artifacts_deps = repository_rule(
    implementation = _az_artifacts_deps_impl,
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