# Lambda Calculus in Julia

This is a simple package that implements the basics of Lambda Calculus using Julia.
I also wanted to make it nice to look at, so it has nice syntax for creating functions and applications.

Next steps are:
- [ ] Booleans
- [ ] Integers
- [ ] Basic Operators




## Simple Examples

```julia
using LambdaCalculus
```

### Define variables
```julia
julia> x = VAR("x")
x
julia> y = VAR("y")
y
```

### Define function
```julia
julia> id = λ(x,x) #identity function
λx.x
```

### Define applications
```julia
julia> id ∘ y
(λx.x)y
julia> id ∘ id
(λx.x)λx.x
```

### Solve the program
```julia
julia> solve(id ∘ y)
y
julia> solve(id ∘ id)
λx.x
julia> solve(id ∘ id) == id
```
