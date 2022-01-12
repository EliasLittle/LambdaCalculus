using MLStyle
import Base.string, Base.show, Base.∘

abstract type CALC end

struct VAR <: CALC
  name::String
end

struct FUN <: CALC
  param::VAR
  body::CALC
end

struct APP <: CALC
  fun::FUN
  body::CALC
end

macro λ(p,b)
  FUN(eval(p),eval(b))
end

function ∘(f::FUN, b::CALC)
  APP(f,b)
end

function replace(a::VAR, b::CALC, arg::CALC)
  @match b begin
      x::VAR => x == a ? arg : x
      x::FUN => FUN(replace(a, x.param, arg), replace(a, x.body, arg))
      x::APP => APP(replace(a, x.fun, arg), replace(a, x.body, arg))
  end
end

function eval(a::APP)
   replace(a.fun.param, a.fun.body, a.body)
end

string(f::FUN) = "λ"*string(f.param)*"."*string(f.body)
string(v::VAR) = v.name
string(a::APP) = "("*string(a.fun)*")"*string(a.body)

show(io::IO, x::CALC) = print(io, string(x))
