#
# Copyright 2019 The Abseil Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

workspace(name = "com_google_absl")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "artifactory_tools",
    branch = "master",
    remote = "https://github.com/muon-developers/artifactory-tools.git",
)

load("@artifactory_tools//azure:deps.bzl", "az_artifacts_deps")

az_artifacts_deps(
    name = "rules_cc",	
    package = "rules_cc",	
    version = "1.0.1",
    archive = "rules_cc-262ebec3c2296296526740db4aefce68c80de7fa.zip"
)

az_artifacts_deps(
    name = "com_google_googletest",	
    package = "googletest",	
    version = "1.0.0",
    archive = "googletest-b6cd405286ed8635ece71c72f118e659f4ade3fb.zip"
)

az_artifacts_deps(
    name = "com_github_google_benchmark",	
    package = "google_benchmark",	
    version = "1.0.0",
    archive = "benchmark-16703ff83c1ae6d53e5155df3bb3ab0bc96083be.zip"
)


