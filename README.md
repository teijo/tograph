# tograph

Haskell exercise for plotting CSV/TSV files.

## OS X Setup

Install Haskell and Cabal.

```
brew install ghc cabal-install
```

## Running

To setup build environment (once)

```
cabal sanbox init
```

To update dependencies (after init or dependency update)

```
cabal install
```

To recompile and run

```
cabal run
```
