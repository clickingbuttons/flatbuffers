# flatbuffers

![zig-version](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fclickingbuttons%2Fflatbuffers%2Fmaster%2F.github%2Fworkflows%2Ftest.yml&query=%24.jobs.test.steps%5B1%5D.with.version&label=zig-version)
![tests](https://github.com/clickingbuttons/flatbuffers/actions/workflows/test.yml/badge.svg)

Stripped down fork of [flatbuffers](https://github.com/google/flatbuffers) that produces a `flatc`
binary for use in [flatbuffers-zig](https://github.com/clickingbuttons/flatbuffers-zig).

Should ideally emit a library, but there's no upstream API. Could add one upstream or make one here
downstream.
