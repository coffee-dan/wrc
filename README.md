# wrc - as in "Worse"

`:--)`


## Quickshell pkg

> Writing Nix expressions for Qt libraries and applications is largely similar as for other C++ software. [...]
>
> The major caveat with Qt applications is that Qt uses a plugin system to load additional modules at runtime. In Nixpkgs, we wrap Qt applications to inject environment variables telling Qt where to discover the required plugins and QML modules.
>
> This effectively makes the runtime dependencies pure and explicit at build-time, at the cost of introducing an extra indirection.

-- Taken from [Nixpkgs Reference Manual section on Qt](https://nixos.org/manual/nixpkgs/stable/#sec-language-qt)


For this reason the quickshell desktop components are run via a wrapped quickshell binary so that quickshell has access to QML components like `IdleInhibitor`.
