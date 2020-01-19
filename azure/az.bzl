def _artifacts_repo_impl(ctx):
   print("Inside implementation block")
   ctx.execute(["curl", "-LOk", ctx.attr.url]) # change this to az download
   ctx.extract(ctx.attr.archive) # extract the zip

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